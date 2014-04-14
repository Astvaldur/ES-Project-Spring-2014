library IEEE;
use IEEE.std_logic_1164.all;

entity clk_enable is
    Generic(freq: integer:=250; half: integer:=125);
   port (
      reset : in std_logic;
      clk  : in std_logic;
      Enable : out std_logic
      );
end clk_enable;

architecture arch_clk_enable of  clk_enable is
  begin
    
    process(clk, reset)
    variable counter:integer:=0;
    begin
      if(reset = '1') then
        counter := 0;
        Enable <= '0';
	    elsif rising_edge(clk) then
            counter:=counter+1;
            if(counter>=freq) then
                Enable<='1';
                counter := 0;
            elsif(counter>=half) then
                Enable<='1';
            else
                Enable<='0';
            end if;
	    end if;
  end process;	
end arch_clk_enable;