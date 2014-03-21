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
USE ieee.std_logic_unsigned.all;
--use IEEE.MATH_REAL.ALL;

--! This is the PWM entity.
--! 
entity PWM is
   GENERIC(
           width   : integer  := 16; -- Bit resulution of the input bit vector
           op_freq : integer  := 200_000; --! The 2*frequency of the Pulses that we output.
           sys_clk : integer  := 100_000_000); --! The overall system clock
    PORT(
        --! system
        reset : in std_logic;    --! System reset, active low.
        clk   : in std_logic;    --! The clock input.
        --! in
        vsample: in	std_logic_vector(width-1 downto 0);
        --! out
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
    else
        return value;
    end if;

end  integerbitsize;
CONSTANT pwm_period: std_logic_vector(8 downto 0):=std_logic_vector(to_unsigned(510,9)); --511
signal inputs :	std_logic_vector(width-1 downto 0):= (others=>'1');

type state_t is (running, new_data);--! Counter for period.
   

Type reg_t is 
record
    state : state_t;
    pwm_out : std_logic ; --! Output for PWM --! Index shift.
end record;

constant bull : reg_t := (state =>new_data,
                          pwm_out =>'1' );--! Index shift.

signal r : reg_t := bull;

begin
inputs<=vsample;
--! combinatorial process --------------------------------------
comb:process(clk,reset) 

variable period_counter : std_logic_vector(8 downto 0):=(others=>'0');
variable pwm_index_shift : std_logic_vector(8 downto 0);
begin 
    if(reset = '0') then -- Active high
        r.pwm_out <= '1';
        period_counter := (others=>'0');
        pwm_index_shift :=(others=>'0');
        r.state <= new_data;
    elsif rising_edge(clk) then
             period_counter := std_logic_vector(unsigned(period_counter) + 1);
            if( r.state=new_data) then
                  period_counter :=(others=>'0');             
                  pwm_index_shift := inputs(width-1 downto width-9);
                  r.state<=running;
            end if;

            -- NEW DATA?
            if(period_counter >= pwm_period) then r.state<=new_data;
            else r.state <= running;
            end if;

            -- HIGH or LOW
            if(period_counter >= pwm_index_shift) then r.pwm_out <='0';
            else r.pwm_out <='1'; 
            end if;
           
    end if;
end process;

-- Pins for the modules --------------------------------------
ampPWM <= r.pwm_out;-- Input to LP
ampSD <= '1';
--ampSD <= '0';     -- This pin selects the amplifiers to be ON.
end RTL;
