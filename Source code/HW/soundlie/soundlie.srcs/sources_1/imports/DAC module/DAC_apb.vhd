library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

library work;
use work.PWM_pkg.all;

entity DACapb is
  generic(
    --AMBA
    pindex      : integer := 0;
    paddr       : integer := 0;
    pmask       : integer := 16#fff#;
    width       : integer := 16;
    sclk_freq   : integer := 50
    );
  port (
    --AMBA
    rstn	: in  std_ulogic;
    clk		: in  std_ulogic;
    apbi	: in  apb_slv_in_type;
    apbo	: out  apb_slv_out_type;
    
    --PWM
    ampPWM	: out std_logic;  				--! The ouput PWM signal, It is connected to the input of the filter. 
    ampSD	: out std_logic;   				--! We need to select the filter to be on.

    --DAC
    dac_sclk  : out  std_ulogic;        --! Serial clock
    dac_sync : out std_logic;
    dac_DIN : out std_logic -- SDI
  );                      
 
end entity DACapb;

architecture rtl of DACapb is

  -- APB related signals
  type PWM_registers is record
    --PWMreg: std_logic_vector(31 downto 0);
    vsample : std_logic_vector(31 downto 0);
    dac_write : std_logic;
  end record;

  signal apb_reg    : PWM_registers;
  signal apb_reg_in : PWM_registers;
  
  signal vsample : std_logic_vector(31 downto 0);  
  signal dac_write : std_logic:='0';  
  signal dac_fin : std_logic:='1';  
  signal dac_sclk_sig : std_logic:='0';
  signal dac_sync_sig : std_logic:='1';   
  signal dac_DIN_sig : std_logic:='0';
--constant REVISION       : amba_version_type := 0; 
constant pconfig        : apb_config_type := (
                        0 => ahb_device_reg ( VENDOR_OPENCORES, GAISLER_GPREG, 0, 0, 0),
                        1 => apb_iobar(paddr, pmask));
--
--COMPONENT dac_clk
--  PORT (
--          reset : in std_logic;
--          clk : in std_logic;
--          clk_out: in std_logic
--    );
--end component;
component clk_enable is
    Generic(freq: integer:=50; half: integer:=25);
   port (
      reset : in std_logic;
      clk  : in std_logic;
      Enable : out std_logic
      );
 end component;

begin
dac_sclk <=dac_sclk_sig;
dac_sync <=dac_sync_sig;
dac_DIN <=dac_DIN_sig;

  -- combinatorial process
  apb_comb : process(apb_reg, apbi, dac_sync_sig)
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
  -- if(dac_sync_sig = '0') then
  --      v.dac_write :='0';
  --  end if;

    -- Write registers
    if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(4 downto 2) is
        when "000" =>
          v.vsample := apbi.pwdata;
          v.dac_write :='1';
          --v.PWMreg := apbi.pwdata;
          --v.vsample:= v.PWMreg(width-1 downto 0);
        when others =>
      end case;
    end if;

    apb_reg_in <= v;
    vsample <= apb_reg.vsample;
  end process;

  -- Sequential process
  regs: process (clk,rstn)
  begin
    if rstn = '0' then
      apb_reg.vsample <= (others => '0');
      apb_reg.dac_write <='0';
    elsif rising_edge(clk) then
      apb_reg <= apb_reg_in;
    end if;
  end process;

  -- Set APB bus signals
  apbo.pirq    <= (others => '0'); -- No IRQ
  apbo.pindex  <= pindex;          -- VHDL Generic
  apbo.pconfig <= PCONFIG;         -- VHDL Constant

DAC_SPI_comp: dac_interface 
  generic map(width => 16)
  port map(
    reset => rstn, sclk =>dac_sclk_sig,
    data_input  => not(vsample(15)) &  vsample(14 downto 0),
    write_data  => apb_reg.dac_write,
    DAC_shutdown=> "00", 
    sync =>dac_sync_sig,
    DIN =>dac_DIN_sig, -- SDI
    finished =>dac_fin
  );
    
--sclk_gen: dac_clk --5 MHz
--  PORT MAP(
--          reset => rstn,
--          clk => clk,
--          clk_out => dac_sclk_sig
--    );


  slck_comp: clk_enable
    Generic map(freq =>50, half=>25)
   port map (
            reset => rstn,
            clk => clk,
            Enable => dac_sclk_sig
      );

  PWM_comp: PWM
  generic map (width => 16)
  port map (reset =>  rstn,clk => clk,vsample => not vsample(width-1) &  vsample((width-2) downto 0),
	ampPWM => ampPWM, --width??
	ampSD => ampSD --width??
  ) ;
   -- pragma translate_off   
   bootmsg : report_version 
   generic map ("apbvgreport_versiona" & tost(pindex) & ": LED Control rev 0");
   -- pragma translate_on

end rtl;
