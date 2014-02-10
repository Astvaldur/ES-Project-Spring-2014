----------------------------------------------------------
------              PWM Control                    -------
----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;


entity PWM is
   GENERIC(
        width   : integer  := 12; -- bit resulution
        op_freq : integer  := 200_000;
        sys_clk : integer  := 100_000_000;);
    PORT(
    -- in
	vsample: in	std_logic_vector(width-1 downto 0); -- Sample
    enable: in  std_logic;           -- Sample clock
	--system
	reset : in std_logic;    -- system reset
    clk   : in std_logic;      -- System clock
    -- out
	Pwm_signal	: out	std_logic_vector(width-1 downto 0)); 
end;

architecture RTL of PWM is
-- This is the current 
CONSTANT pwm_period: INTEGER := sys_clk/op_freq;
--signal clk_cntr_reg : std_logic_vector (4 downto 0) := (others=>'0'); 
TYPE counters of INTEGER RANGE 0 to pwm_period-1;

Type reg_t is record
        pwm_out : std_logic := '0';
        pwm_in : std_logic_vector(width-1 downto 0) := (others=>'0');
        period_counter : counters := (OTHERS => '0');
end record;

-- registers
signal r, rin :reg_t;

begin

reg:process(clk,reset) -- sequential process
begin
    if(reset='1') then
        r.pwm_out <='0';
        r.pwm_in  <= (others=>'0');
        r.period_counter <= (others=>'0')
    elsif (rising_edge(CLK)) then -- COUNTER
        r<=rin;
        r.period_counter <= std_logic_vector(period_counter + '1'); --fix   
    elsif(enable='1') then
        r.pwm_in <= vsample;        
    end if;
end process;

comb:process(period_counter,enable) -- combinatorial process
variable v : reg_t;
begin
     if(rin.pwm_in /= r.pwm_in) then
        
     v:=r;
      if(duty_cycle)
end process;


-- Pins for the modules
ampPWM <= pwm_out;-- Input to LP
ampSD <= '1';     -- This pin selects the amplifiers to be ON.

end Behavioral;
