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
CONSTANT pwm_period: INTEGER:=(sys_clk/op_freq)-1;

Type reg_t is record
        pwm_out : std_logic ;
        pwm_in : std_logic_vector(width-1 downto 0);
        period_counter : std_logic_vector(width-1 downto 0);
        pwm_index_shift : std_logic_vector(width-1 downto 0);
end record;

-- registers
signal r, rin :reg_t;

begin
reg:process(clk,reset) -- sequential process
begin
    if(reset = '0') then -- 1 or 0 ?
        r.pwm_out <= '0';
        r.pwm_in  <= (others=>'0');
        r.period_counter <= (others=>'0');
        r.pwm_index_shift <= (others=>'0');
      
    elsif (rising_edge(CLK)) then -- COUNTER
        r<=rin;
        r.period_counter <= std_logic_vector(unsigned(r.period_counter)+1);
    end if;
end process;

comb:process(r,vsample) -- combinatorial process
variable v : reg_t;
begin
     v:=r;
      if(TO_INTEGER(UNSIGNED(r.period_counter)) = 0) then
          -- new cycle started. collect sample
          v.pwm_in:=vsample; -- New Input
          -- CALCULATE SHIFTING INDEX HERE
          v.pwm_index_shift := STD_LOGIC_VECTOR(UNSIGNED(TO_INTEGER(UNSIGNED(v.pwm_in))*pwm_period/(2**width)),width);
          --v.period_counter:=(others=>'0');
      elsif(r.pwm_index_shift >= r.period_counter) then
          -- if index number is larger or equal than counter keep it high
          v.pwm_out := '1';
             
      elsif(r.period_counter > r.pwm_index_shift) then
          -- if  the counter is larger than the index where the shift should occur. set pwm low
          v.pwm_out := '0';
      ELSIF(TO_INTEGER(UNSIGNED(r.period_counter)) = pwm_period) THEN
        -- end of cycle reset index.
        v.period_counter := (OTHERS => '0');
      END IF;
 rin <= v;
end process;

-- Pins for the modules
ampPWM <= r.pwm_out;-- Input to LP
ampSD <= '1';     -- This pin selects the amplifiers to be ON.
end RTL;
