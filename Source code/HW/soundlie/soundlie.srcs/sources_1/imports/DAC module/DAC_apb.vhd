--! @file DAC_apb.vhd
--! @brief This is the output stage wrapper, it handles the communication to the DAC.
--! @details The output stage wrapper takes input from the AMBA peripheral bus APB
--! and sends it the SPI communication interface and the PWM interface. The wrapper 
--! then sends the output results from them to the corresponding outputs.
--! The PWM was kept in the device for development purposes and can be excluded,
--! in the final product. It is good to have this functionality if the DAC breaks
--! down during development.
--! @author Tobias Hallberg
--! @author Ástvaldur Hjartarson
--! @author Gaisler.
--! @version 2.0


library ieee;--! Use standard library
use ieee.std_logic_1164.all;--! Use ieee 1164 standard for logic elements.
use ieee.numeric_std.all;--! Use ieee numeric standard
library grlib;--! Use the grlib from Gaisler.
use grlib.amba.all;--! Use the AMBA grlib from Gaisler.
use grlib.stdlib.all;--! Use the stdlib grlib from Gaisler.
use grlib.devices.all;--! Use the devices grlib from Gaisler.

library work;
use work.PWM_pkg.all;--! Include the PWM module.

entity DACapb is
  generic(
    --! Generic values(can be overridden by a higher  VHDL code like LEON3):
    pindex      : integer := 0; --! AMBA peripheral index.
    paddr       : integer := 0; --! AMBA peripheral address. 
    pmask       : integer := 16#fff#; --! AMBA peripheral mask.
    width       : integer := 16; --! AMBA data width.
    sclk_freq   : integer := 50 --! SPI clock value for changing the frequency.  
    );
  port (
    --AMBA
    rstn	: in  std_ulogic; --! system reset input, restart is active low('0').
    clk		: in  std_ulogic; --! system clock input.
    apbi	: in  apb_slv_in_type; --! AMBA peripheral bus data input to the device.
    apbo	: out  apb_slv_out_type; --! AMBA peripheral bus data output from the device.
    
    --PWM
    ampPWM	: out std_logic;  --! The output PWM signal, It is connected to the input of the filter. 
    ampSD	: out std_logic;  --! The amplifier select signal

    --! SPI communication output
    dac_sclk  : out  std_ulogic;        --!  Serial clock  signal.
    dac_sync : out std_logic;           --!  Synchronization  signal.
    dac_DIN : out std_logic             --!  Serial Data signal.
  );                      
 
end entity DACapb;

--! @brief This the APB interface architecture.
--! @details This is a modified version of the Gaisler APH tutorial code.
--! It interfaces with the APB in the way that is done in the tutorial, with
--! slight modification to the registers(just one register). 
--! The interface has three sub-modules added to the original design.
--! 1. PWM interface for converting samples and outputting straight to the on-board reconstruction filter 
--! 2. SPI communication message generation(DAC_interface).
--! 3. clock enable that generates the serial communication clock for the SPI communications.

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
