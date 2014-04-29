library IEEE;
use IEEE.std_logic_1164.all;

entity clk_enable is
    Generic(freq: integer:=50; half: integer:=25);
   port (
      reset : in std_logic;
      clk  : in std_logic;
      Enable : out std_logic
      );
end clk_enable;

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