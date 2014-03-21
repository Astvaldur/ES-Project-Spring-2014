library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

library work;
use work.PWM_pkg.all;

entity PWMapb is
  generic(
    --AMBA
    pindex      : integer := 0;
    paddr       : integer := 0;
    pmask       : integer := 16#fff#;

    --PWM
    width   	: integer := 16; 				-- Bit resulution of the input bit vector
    op_freq 	: integer := 200_000; 				--! The 2*frequency of the Pulses that we output.
    sys_clk 	: integer := 100_000_000 			--! The overall system clock
    );
  port (
    --AMBA
    rstn	: in  std_ulogic;
    clk		: in  std_ulogic;
    apbi	: in  apb_slv_in_type;
    apbo	: out  apb_slv_out_type;
    
    --PWM
    pwm_clk	: in  std_ulogic;				--! System clock
    ampPWM	: out std_logic;  				--! The ouput PWM signal, It is connected to the input of the filter. 
    ampSD	: out std_logic   				--! We need to select the filter to be on.
  );                      
 
end entity PWMapb;

architecture rtl of PWMapb is

  -- APB related signals
  type PWM_registers is record
    --PWMreg: std_logic_vector(31 downto 0);
    vsample: std_logic_vector(31 downto 0);
  end record;

  signal apb_reg    : PWM_registers;
  signal apb_reg_in : PWM_registers;
  
  signal vsample : std_logic_vector(31 downto 0);  

--constant REVISION       : amba_version_type := 0; 
constant pconfig        : apb_config_type := (
                        0 => ahb_device_reg ( VENDOR_OPENCORES, GAISLER_GPREG, 0, 0, 0),
                        1 => apb_iobar(paddr, pmask));

begin

  -- combinatorial process
  apb_comb : process(rstn, apb_reg, apbi)
    variable v : PWM_registers;
    
  begin
    v := apb_reg;

    -- Read registers
    apbo.prdata <= (others => '0');
    case apbi.paddr(4 downto 2) is         
      when "000" =>
          apbo.prdata <= apb_reg.vsample;
      when others =>
    end case;

    -- Write registers
    if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(4 downto 2) is
        when "000" =>
          v.vsample := apbi.pwdata;
          --v.PWMreg := apbi.pwdata;
          --v.vsample:= v.PWMreg(width-1 downto 0);
        when others =>
      end case;
    end if;

    -- Reset registers
    if rstn = '0' then
      v.vsample := (others => '0');
    end if;

    apb_reg_in <= v;
    vsample <= apb_reg.vsample;
  end process;

  -- Sequential process
  regs: process (clk)
  begin
    if rstn = '0' then
      apb_reg.vsample <= (others => '0');
    elsif rising_edge(clk) then
      apb_reg <= apb_reg_in;
    end if;
  end process;

  -- Set APB bus signals
  apbo.pirq    <= (others => '0'); -- No IRQ
  apbo.pindex  <= pindex;          -- VHDL Generic
  apbo.pconfig <= PCONFIG;         -- VHDL Constant

  PWM_comp: PWM
  generic map (
	width => width, --set the generic values here so we dont have to do it in the top entity??
 	op_freq => op_freq, 
	sys_clk => sys_clk
  )
  port map (reset => rstn,
	clk => pwm_clk, -- Wrong clock, should be sys clk not APB clk
	vsample => vsample(width-1 downto 0),
	ampPWM => ampPWM, --width??
	ampSD => ampSD --width??
  ) ;

   -- pragma translate_off   
   bootmsg : report_version 
   generic map ("apbvgreport_versiona" & tost(pindex) & ": LED Control rev 0");
   -- pragma translate_on

end rtl;
