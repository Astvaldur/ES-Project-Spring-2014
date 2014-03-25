----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2014 10:31:13 PM
-- Design Name: 
-- Module Name: interface_XADC - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity interface_XADC is
    Port (  xadc_clk : in std_logic;
            xadc_reset : in std_logic;
            xadc_vp : in  std_logic;
            xadc_vn : in  std_logic;    
            xadc_addr : in  std_logic_vector(6 downto 0);
            xadc_eoc : out std_logic;
            xadc_eos : out std_logic;
            xadc_output : out std_logic_vector(15 downto 0));

end interface_XADC;

architecture Behavioral of interface_XADC is

--XADC signal   
signal xadc_den : std_logic := '1';         
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
            do_out => xadc_output,
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

end Behavioral;

