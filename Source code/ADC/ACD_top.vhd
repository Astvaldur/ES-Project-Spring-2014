----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2014 04:14:09 PM
-- Design Name: 
-- Module Name: ACD_top - Behavioral
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

entity ACD_top is
    Port ( clk : in STD_LOGIC;
           switch : in STD_LOGIC; --switch 0
           vauxn3 : in STD_LOGIC;
           vauxp3 : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR(15 DOWNTO 0);
           JC : out STD_LOGIC;
           reset : in STD_LOGIC); --switch 1
           --led1 : out STD_LOGIC);
           
           
end ACD_top;

architecture Behavioral of ACD_top is

------------------------------
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
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF xadc_wiz_0 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF xadc_wiz_0 : COMPONENT IS "di_in[15:0],daddr_in[6:0],den_in,dwe_in,drdy_out,do_out[15:0],dclk_in,reset_in,vp_in,vn_in,vauxp3,vauxn3,channel_out[4:0],eoc_out,alarm_out,eos_out,busy_out";
-------------------------------

signal di_in_top : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal daddr_in_top: STD_LOGIC_VECTOR(6 DOWNTO 0);
signal den_in_top : STD_LOGIC;
signal dwe_in_top : STD_LOGIC;
signal drdy_out_top : STD_LOGIC;
signal do_out_top : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal dclk_in_top : STD_LOGIC;
signal reset_in_top : STD_LOGIC;
signal vp_in_top : STD_LOGIC;
signal vn_in_top : STD_LOGIC;
signal channel_out_top : STD_LOGIC_VECTOR(4 DOWNTO 0);
signal eoc_out_top : STD_LOGIC;
signal alarm_out_top : STD_LOGIC;
signal eos_out_top : STD_LOGIC;
signal busy_out_top : STD_LOGIC;
signal clk_adc : STD_LOGIC;



begin

reset_in_top <= reset;

clk_adc <= not clk;

led <= do_out_top;

JC <= eoc_out_top; 

process(clk)
begin

  if(reset_in_top = '1') then
    di_in_top <= "0000000000000000";
    daddr_in_top <= "0010011";
    dwe_in_top <= '0';
    den_in_top <= '0';
    
  elsif(rising_edge(clk)) then
    di_in_top <= "0000000000000000";
    daddr_in_top <= "0010011";
    dwe_in_top <= '0';
    den_in_top <= eoc_out_top;

  end if;

end process;


adc_0 : xadc_wiz_0
  PORT MAP (
    di_in => di_in_top,
    daddr_in => daddr_in_top,
    den_in => den_in_top,
    dwe_in => dwe_in_top,
    drdy_out => drdy_out_top,
    do_out => do_out_top,
    dclk_in => clk_adc,
    reset_in => reset_in_top,
    vp_in => '0',
    vn_in => '0',
    vauxp3 => vauxp3,
    vauxn3 => vauxn3,
    channel_out => channel_out_top,
    eoc_out => eoc_out_top,
    alarm_out => alarm_out_top,
    eos_out => eos_out_top,
    busy_out => busy_out_top
  );


--code for switching a led on and off  
--process(switch) 
            
--begin
  -- if (switch = '1') then
   --     led1 <= '1';      --led lights up when logic high (1)
        
  -- else
  --  led1 <= '0';
    
  -- end if;
   
--end process;
      
end Behavioral;
