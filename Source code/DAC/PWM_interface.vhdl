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
        pwm_out : std_logic ;
        pwm_in : std_logic_vector(width-1 downto 0) ;
        period_counter : counters ;
end record;

-- registers
signal r, rin :reg_t;

begin
reg:process(clk,reset) -- sequential process
begin
    if(reset = '1') then -- 1 or 0 ?
        r.pwm_out <='0';
        r.pwm_in  <= (others=>'0');
        r.period_counter <= (others=>'0');
        
    elsif (rising_edge(CLK)) then -- COUNTER
        r<=rin;    
    end if;
end process;

comb:process(r,rin,enable) -- combinatorial process
variable v : reg_t;
begin
     v:=r;
     v.period_counter:= r.period_counter +1;
      if(r.period_counter = (pwm_period -1)) then
            v:=r.pwm_in;
            v.period_counter:=(others=>'0');
      elsif(r.period_counter <= r.pwm_in) then
             v.pwm_out := '1';  
      elsif(r.period_counter > r.pwm_in) then
             v.pwm_out := '0';
      END IF;
 rin <= v;
end process;


-- Pins for the modules
ampPWM <= pwm_out;-- Input to LP
ampSD <= '1';     -- This pin selects the amplifiers to be ON.

end Behavioral;
