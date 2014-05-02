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
    rstn        : in  std_ulogic;
    clk         : in  std_ulogic;
    apbi        : in  apb_slv_in_type;
    apbo        : out apb_slv_out_type;
	
	--Module specific
	xadc_clk    : in std_logic;
    xadc_vp     : in  std_logic;
    xadc_vn     : in  std_logic;
    xadc_out    : out std_logic_vector(15 downto 0)	
  );                      
 
end entity xadc_apb;

architecture rtl of xadc_apb is

  COMPONENT ila_xadc
  PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
  END COMPONENT;

  -- APB related signals
  type xadc_registers is record
    sample       : std_logic_vector(31 downto 0);
  end record;

  signal apb_reg        : xadc_registers;
  signal apb_reg_in     : xadc_registers;
  
  signal sample         : std_logic_vector(15 downto 0);
  signal xadc_irq       : std_logic;
  signal xadc_irq_delay : std_logic;
  signal pirq           : std_logic;
  signal xadc_eoc       : std_logic;
  signal xadc_sample    : std_logic_vector(15 downto 0);
  
  signal fir_y          : std_logic_vector(31 downto 0);
  
  -- ILA
  signal probe0   : std_logic_vector(0 downto 0);
  signal probe1   : std_logic_vector(0 downto 0);
  signal probe2   : std_logic_vector(0 downto 0);
  
--constant REVISION       : amba_version_type := 0; 
constant pconfig        : apb_config_type := (
                        0 => ahb_device_reg ( VENDOR_OPENCORES, GAISLER_GPREG, 0, 0, 0),
                        1 => apb_iobar(paddr, pmask));

constant ADC_OUTPUT_ADDR : std_logic_vector(6 downto 0) := "0010011"; --x03

begin

  xadc_out(15 downto 0) <= sample;
  
  sample(15 downto 0) <= fir_y(31 downto 16);
  
  
  -- ILA
  probe0(0) <= xadc_eoc;
  probe1(0) <= xadc_irq;
  probe2(0) <= pirq;

  -- combinatorial process
  apb_comb : process(rstn, apb_reg, apbi)
    variable v : xadc_registers;
  begin
    v := apb_reg;

    -- Read registers
    apbo.prdata <= (others => '0');
    case apbi.paddr(4 downto 2) is         
      when "000" =>
          -- Invert MSB to change representation
          apbo.prdata <= sample;
      when others =>
    end case;

    -- Reset registers
    if rstn = '0' then
      v.sample         := (others => '0');
    end if;

    apb_reg_in <= v;
    apb_reg.sample <= sample;
    
  end process;

  -- Sequential process
  regs: process (clk)
  begin
    if rstn = '0' then
      apb_reg.sample <= (others => '0');
    elsif rising_edge(clk) then
      apb_reg <= apb_reg_in;
    end if;
  end process;
  
  clk_sync: process (clk)
  begin
    if rising_edge(clk) then
        pirq <= xadc_irq OR xadc_irq_delay;
    end if;
  end process;
  
  xadc_irq_sync: process (xadc_irq)
  begin
    if rising_edge(xadc_clk) then
        xadc_irq_delay <= xadc_irq;
    end if;
  end process;

  -- Set APB bus signals
  apbo.pirq(10) <= pirq;           -- IRQ
  apbo.pindex  <= pindex;          -- VHDL Generic
  apbo.pconfig <= PCONFIG;         -- VHDL Constant

  xadc: interface_XADC
  port map (
	xadc_clk => xadc_clk, 
    xadc_reset => rstn,
    xadc_vp => xadc_vp,
    xadc_vn => xadc_vn,    
    xadc_addr => ADC_OUTPUT_ADDR,    
    xadc_eoc => xadc_eoc,
    xadc_output => xadc_sample
  ); 
  
  fir: top_fir
  port map (
      reset => not rstn,
      start => xadc_eoc,
      clk => xadc_clk,
      x => xadc_sample,
      finish => xadc_irq,
      y => fir_y
  );
  
   -- pragma translate_off   
   bootmsg : report_version 
   generic map ("apbvgreport_versiona" & tost(pindex) & ": LED Control rev 0");
   -- pragma translate_on
   
--     ila_xdc0 : ila_xadc
--     PORT MAP (
--       clk => clk,
--       probe0 => probe0,
--       probe1 => probe1,
--       probe2 => probe2
--     );


end rtl;

