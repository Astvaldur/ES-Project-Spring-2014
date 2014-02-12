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
        sys_clk : integer  := 100_000_000);
    PORT(
    -- in
	vsample: in	std_logic_vector(width-1 downto 0); -- Sample
    --system
	reset : in std_logic;    -- system reset
    clk   : in std_logic;    -- System clock
    -- out
	ampPWM	: out	std_logic;  -- PWM signal 
    ampSD	: out	std_logic   -- select the amplifier
    );
end entity;


architecture RTL of PWM is
-- This is the current 
CONSTANT pwm_period: std_logic_vector:=std_logic_vector(to_unsigned(sys_clk/op_freq -1,width));

Type reg_t is record
        pwm_out : std_logic ;
        pwm_in : std_logic_vector(width-1 downto 0);
        period_counter : std_logic_vector(width-1 downto 0) ;
end record;

-- registers
signal r, rin :reg_t;

begin
reg:process(clk,reset) -- sequential process
begin
    if(reset = '1') then -- 1 or 0 ?
        r.pwm_out <= '0';
        r.pwm_in  <= (others=>'0');
        r.period_counter <= (others=>'0');
      
    elsif (rising_edge(CLK)) then -- COUNTER
        r<=rin;    
    end if;
end process;

comb:process(r,rin) -- combinatorial process
variable v : reg_t;
begin
     v:=r;
     v.period_counter := std_logic_vector(unsigned(r.period_counter)+1);
      if(r.period_counter = pwm_period) then
            v.pwm_in:=r.pwm_in; -- New Input
            v.period_counter:=(others=>'0');
      elsif(r.pwm_in >= r.period_counter) then
             v.pwm_out := '1';  
      elsif(r.period_counter > r.pwm_in) then
             v.pwm_out := '0';
      END IF;
 rin <= v;
end process;


-- Pins for the modules
ampPWM <= r.pwm_out;-- Input to LP
ampSD <= '1';     -- This pin selects the amplifiers to be ON.

end RTL;
