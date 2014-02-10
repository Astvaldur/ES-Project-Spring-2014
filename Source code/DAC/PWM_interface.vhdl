----------------------------------------------------------
------              PWM Control                    -------
----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;


entity PWM is
   generic(width:integer := 32);
    port(
    -- in
	OpA	: in	std_logic_vector(width-1 downto 0);
	OpB	: in	std_logic_vector(width-1 downto 0);
	opcode: in	std_logic_vector(3 downto 0);
	--system
	reset: in std_logic;
    clk: in std_logic;
    -- out
	Result	: out	std_logic_vector(width-1 downto 0)); 
end;

architecture RTL of PWM is


begin

-- Clock counter register
process(CLK)
begin
  if (rising_edge(CLK)) then
    clk_cntr_reg <= clk_cntr_reg + 1;
  end if;
end process;

-- Converting freq of PDM to freq of PWM
--micClk = 100MHz / 32 = 3.125 MHz
micClk <= clk_cntr_reg(4);


-- PWM audio output
process(CLK)
begin
  if (rising_edge(CLK)) then
    if (clk_cntr_reg = "01111") then
      pwm_val_reg <= micData;
    end if;
  end if;
end process;

-- Pins for the modules
micLRSel <= '0';
ampPWM <= pwm_val_reg;
ampSD <= '1';

end Behavioral;
