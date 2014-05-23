--! @file interface_XADC.vhd
--! @brief interface for the XADC. 
--! @details Interface developed to handle the communication with the XADC on the Artix-7 FPGA.
--! @author Jonas Andersson & Malin Eliasson
--! @version 1.0

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 --! interface_XADC Entity
entity interface_XADC is
    Port (  xadc_clk : in std_logic;  --! input clock 
            xadc_reset : in std_logic; --! input reset
            xadc_vp : in  std_logic; --! input XADC positive V
            xadc_vn : in  std_logic; --! input XADC negative V
            xadc_addr : in  std_logic_vector(6 downto 0); --! input vector for the XADC status register address
            xadc_eoc : out std_logic; --! output XADC end of conversion
            xadc_eos : out std_logic; --! output XADC end of sequence
            xadc_output : out std_logic_vector(15 downto 0)); --! output XADC output result

end interface_XADC;

--! @brief interface to the XADC
--! @details interface to the XADC IP core from Xilinx. 
--! The XADC is setup as a single channel, continues, bipoal ADC
architecture Behavioral of interface_XADC is

--XADC signal   
signal xadc_den : std_logic := '1';   
signal xadc_output_temp : std_logic_vector(15 downto 0);
--signal xadc_rdy : std_logic;                       

COMPONENT xadc_wiz_0
  PORT (
      di_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      daddr_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      den_in : IN STD_LOGIC;
      dwe_in : IN STD_LOGIC;
      drdy_out : OUT STD_LOGIC;
      do_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      dclk_in : IN STD_LOGIC;
      reset_in : IN STD_LOGIC;
      vp_in : IN STD_LOGIC;
      vn_in : IN STD_LOGIC;
      vauxp3 : IN STD_LOGIC;
      vauxn3 : IN STD_LOGIC;
      channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      eoc_out : OUT STD_LOGIC;
      alarm_out : OUT STD_LOGIC;
      eos_out : OUT STD_LOGIC;
      busy_out : OUT STD_LOGIC
  );
END COMPONENT;

begin

xadc: xadc_wiz_0
PORT MAP (  di_in => (others => '0'),
            daddr_in => xadc_addr, 
            den_in => xadc_den,
            dwe_in => '0',
            --drdy_out => xadc_rdy,
            do_out => xadc_output_temp,
            dclk_in => xadc_clk,
            reset_in => not xadc_reset,
            vp_in => '0',
            vn_in => '0',
            vauxp3 => xadc_vp,
            vauxn3 => xadc_vn,
            --channel_out => ,
            eoc_out => xadc_den,
            --alarm_out => ,
            eos_out => xadc_eos
            --busy_out => xadc_busy
            );


-- CONCURRENT STATEMENTS
xadc_eoc <= xadc_den;
xadc_output(15 downto 4) <= xadc_output_temp(15 downto 4);
xadc_output(3 downto 0) <= "1111" WHEN xadc_output_temp(15)='1' ELSE "0000";

end Behavioral;

