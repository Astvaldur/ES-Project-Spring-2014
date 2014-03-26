library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;


library work;
use work.xadc_pkg.all;

entity xadc_apb is
  generic(
    pindex      : integer := 0;
    paddr       : integer := 0;
    pmask       : integer := 16#fff#
    );
  port (
    rstn  : in  std_ulogic;
    clk   : in  std_ulogic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
	
	--Module specific
	xadc_clk : in std_logic;
    xadc_reset : in std_logic;
    xadc_vp : in  std_logic;
    xadc_vn : in  std_logic;
    xadc_out : out std_logic_vector(15 downto 0)       
    --xadc_eoc : out std_logic;
    --xadc_output : out std_logic_vector(15 downto 0)	
  );                      
 
end entity xadc_apb;

architecture rtl of xadc_apb is

  COMPONENT ila_xadc
  PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
  END COMPONENT;

  -- APB related signals
  type xadc_registers is record
    comb_out       : std_logic_vector(31 downto 0);
  end record;

  signal apb_reg    : xadc_registers;
  signal apb_reg_in : xadc_registers;
  
  signal comb_out   : std_logic_vector(31 downto 0);
  signal irq        : std_logic_vector(0 downto 0);
  signal eoc        : std_logic_vector(0 downto 0);


--constant REVISION       : amba_version_type := 0; 
constant pconfig        : apb_config_type := (
                        0 => ahb_device_reg ( VENDOR_OPENCORES, GAISLER_GPREG, 0, 0, 0),
                        1 => apb_iobar(paddr, pmask));

constant ADC_OUTPUT_ADDR : std_logic_vector(6 downto 0) := "0010011"; --x03

begin

  xadc_out <= comb_out(15 downto 0);
  
  comb_out(30 downto 16) <= (others => '0');

  -- combinatorial process
  apb_comb : process(rstn, apb_reg, apbi)
    variable v : xadc_registers;
  begin
    v := apb_reg;

    -- Read registers
    apbo.prdata <= (others => '0');
    case apbi.paddr(4 downto 2) is         
      when "000" =>
          apbo.prdata <= not(comb_out(15))&comb_out(14 downto 0);
      when "001" =>
          apbo.prdata <= "00001111000011110000111100001111"; 
       
      when others =>
    end case;

   --Write registers
   -- if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
     -- case apbi.paddr(4 downto 2) is
       -- when "000" =>
          -- v.A := apbi.pwdata;
        -- when "001" =>
          -- v.B := apbi.pwdata;
        -- when others =>
      -- end case;
    -- end if;

    -- Reset registers
    if rstn = '0' then
      v.comb_out         := (others => '0');
    end if;

    apb_reg_in <= v;
    
    apb_reg.comb_out <= comb_out;
    
  end process;

  -- Sequential process
  regs: process (clk)
  begin
    if rstn = '0' then
      apb_reg.comb_out <= (others => '0');
    elsif rising_edge(clk) then
      apb_reg <= apb_reg_in;
    end if;
  end process;

  -- Set APB bus signals
  apbo.pirq(10) <= irq(0);            -- IRQ
  apbo.pindex  <= pindex;          -- VHDL Generic
  apbo.pconfig <= PCONFIG;         -- VHDL Constant

  xadc: interface_XADC
  port map (
	xadc_clk => xadc_clk, 
    xadc_reset => '1',
    xadc_vp => xadc_vp,
    xadc_vn => xadc_vn,    
    xadc_addr => ADC_OUTPUT_ADDR,    
    xadc_eoc => irq(0),
    xadc_output => comb_out(15 downto 0)
  ); 
  
--  process(clk, irq(0)) 
--  begin
--      if rising_edge(clk) then 
--          if eoc(0) = '1' and irq(0) = '0' then
--              irq(0) <= '1';
--          else
--              irq(0) <= '0';
--          end if;
--      end if;
--  end process;

   -- pragma translate_off   
   bootmsg : report_version 
   generic map ("apbvgreport_versiona" & tost(pindex) & ": LED Control rev 0");
   -- pragma translate_on
   
     ila_xdc0 : ila_xadc
     PORT MAP (
       clk => clk,
       probe0 => irq,
       probe1 => eoc
     );


end rtl;

