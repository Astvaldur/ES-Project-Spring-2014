--! @file clk_enable.vhd
--! @brief This a clock enable component. 
--! @details The clock enable component is used to count clock cycles from 
--! the system clock and set the output high and low after the counter reaches
--! a certain value. This value determines the output clock frequency.
--! @author Ástvaldur Hjartarson
--! @version 1.0

--! Use standard library
library IEEE;
--! Use logic elements
use IEEE.std_logic_1164.all;

 --! This is the clock enable entity.
entity clk_enable is
    Generic(freq: integer:=50; half: integer:=25);
   port (
      reset : in std_logic;--! reset input, we restart at active low('0').
      clk  : in std_logic;--! system clock input
      Enable : out std_logic--! The output clock.
      );
end clk_enable;
--! @brief This a clock enable component architecture. 
--! @details The clock enable component counts the clock cycle
--! and when it has reach a certain value it will set the output high.
--! After setting the output high it counts the clock cycle until it gets the same
--! certain value and puts the output  low.
architecture arch_clk_enable of  clk_enable is
signal enable_sig : std_logic:='0';
  begin
    process(clk, reset)
    variable counter:integer:=0;
    begin
	    if rising_edge(clk) then
        counter:=counter+1;
        if(reset = '0') then
          counter := 0;
          enable_sig <= '0';
        elsif(counter>=freq) then
          counter := 0;
          enable_sig<='0';
        elsif(counter>=half) then
          enable_sig<='1';
        end if;
	    end if;
  end process;
 Enable <= enable_sig;	
end arch_clk_enable;