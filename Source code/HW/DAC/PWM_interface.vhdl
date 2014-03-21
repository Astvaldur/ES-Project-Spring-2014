-------------------------------------------------------
--! @file source PWM_interface.vhdl
--! @This is the Pwm. It ouputs pulses with Pulse width modulation
--! to a fourth order Low pass filter where the pulses are filtered out.
--! This code is developed using a 2 process model.

--! \Astvaldur Hjartarson
--! \1.0v
--! \vhdlflow[PWM]
-------------------------------------------------------

----------------------------------------------------------
------              PWM Control                    -------
----------------------------------------------------------
--! Use standard library
library IEEE;
USE work.all;
--! PWM uses standard logic elements
use IEEE.std_logic_1164.all;
--! Numeric standard.
use ieee.numeric_std.all;
--use IEEE.MATH_REAL.ALL;

--! This is the PWM entity.
--! 
entity PWM is
   GENERIC(
        width   : integer  := 8; -- Bit resulution of the input bit vector
        op_freq : integer  := 200_000; --! The 2*frequency of the Pulses that we output.
        sys_clk : integer  := 100_000_000); --! The overall system clock
    PORT(
    --!system
	reset : in std_logic;    --! System reset, active low.
    clk   : in std_logic;    --! The clock input.
    -- !in
	vsample: in	std_logic_vector(width-1 downto 0); --! The PWM input signal.
    -- !out
	ampPWM	: out	std_logic;  --! The ouput PWM signal, It is connected to the input of the filter. 
    ampSD	: out	 std_logic   --! We need to select the filter to be on.
    );
end entity;

architecture RTL of PWM is
-- This is the current Period can be set shorter for more interpolation.

--! Function------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
--! Function name: integerbitsize
--! Before: The function takes a integer x as a input.
--! After: We get return a integer that represent lowest amount of bits
--!        needed to represent integer x.
function integerbitsize(
size : Integer)
return integer is variable value : integer;
variable tmp: integer;
variable remainder: integer;
begin
    value:=0;
    remainder:=size;
    if(size<=0 or size=1) then
        return 0;
    elsif(abs(size)>1) then
        while (remainder>0)  loop
            remainder:=(remainder-(remainder mod 2))/2;
            value:=value+1;
        end loop;
        return value;
    end if;

end  integerbitsize;
--!------------------------------------------------------------------
--!------------------------------------------------------------------

--! Constants
--! pwm_period is compiler constant for calulating the PWM period.
CONSTANT pwm_period: INTEGER:=(sys_clk/op_freq)-1; --499
--! Resulution is a constant for the highest resulution we can get for 
--! the input bits.
CONSTANT resolution: INTEGER:=2**(width);
--! pwm_period is to see of large a counter we need. This might be change to 
--! 32 bits or any other constant depending on how large the counter might ever
--! become.
CONSTANT Period_counter_range: INTEGER:= integerbitsize(pwm_period); 


  type state_t is (output_high, output_low, new_data);

--! The Record for the 2 process method.
Type reg_t is record
        state : state_t;
        pwm_out : std_logic ; --! Output for PWM 
        pwm_in : std_logic_vector(width-1 downto 0);--! Input for PWM
        period_counter : integer;--! Counter for period.
        pwm_index_shift : integer;--! Index shift.
end record;

--! registers r and rin for 2 process model.
signal r, rin :reg_t;

begin
--! sequential process
reg:process(clk,reset) 
begin
    if(reset = '0') then -- Active low
        r.pwm_out <= '0';
        r.period_counter <= 0;
        r.pwm_index_shift <=0;
        r.pwm_in  <= (others=>'0');
        r.state <= new_data;
    elsif(rising_edge(clk)) then -- COUNTER    
        r<=rin;
    end if;
end process;


--! combinatorial process --------------------------------------
comb:process(r) 
variable v : reg_t;
begin 

    v:=r;
    case r.state is
    when new_data =>--(TO_INTEGER(UNSIGNED(r.period_counter)) = 0 ) =>
          v.period_counter :=0;             
          -- new cycle started. collect sample
          v.pwm_in:=vsample; -- New Input
          -- CALCULATE SHIFTING INDEX 
          v.pwm_index_shift :=  To_integer(unsigned(vsample))*(pwm_period+1)/resolution;
          
          IF(v.pwm_index_shift>1) THEN
            v.state := output_high;
            v.pwm_out := '1';
          elsif(v.pwm_index_shift=1)THEN
            v.state := output_low;
            v.pwm_out := '1';
          ELSE
            v.state := output_low;
            v.pwm_out := '0';
          END IF;
          
      -- If index number is larger or equal than counter keep it high
    when output_high =>--(r.pwm_index_shift >= r.period_counter) =>
        v.period_counter := r.period_counter + 1;
        v.pwm_out := '1';
        
        if(pwm_period = v.period_counter) then
            v.state:=new_data;
        elsif(r.pwm_index_shift = v.period_counter) then
            v.pwm_out := '0';
            v.state:=output_low;
         
        end if;
        
        
      -- If  the counter is larger than the index where the shift should occur. set pwm low      
    when output_low =>--(r.period_counter > r.pwm_index_shift) =>
        v.period_counter := r.period_counter+1;
        v.pwm_out := '0';
        if(pwm_period = v.period_counter) then
            v.state:=new_data;
        end if;

    when others =>
        v.pwm_out := '0';
        v.period_counter := 0;
        v.pwm_index_shift := 0;
        v.pwm_in  := (others=>'0');
        v.state := new_data;
    end case;
    rin <= v;
      
end process;
-- Pins for the modules --------------------------------------

ampPWM <= r.pwm_out;-- Input to LP
--ampSD <= '0';     -- This pin selects the amplifiers to be ON.
end RTL;
