
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ENTITY top_fir IS
		GENERIC(W:INTEGER:=16);
        PORT(reset: IN STD_LOGIC;
			 start: IN STD_LOGIC;
			 clk: IN STD_LOGIC;
             x: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
			 finish: OUT STD_LOGIC;
             y: OUT STD_LOGIC_VECTOR((2*W-1) DOWNTO 0));
END top_fir;
   
    ARCHITECTURE iir_top_calc OF top_fir IS


COMPONENT fir_wrap IS
    	GENERIC(W:INTEGER:=16);
      PORT(reset: IN STD_LOGIC;
					 start: IN STD_LOGIC;
					 clk: IN STD_LOGIC;
           x: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
					 finish: OUT STD_LOGIC;
           y: OUT STD_LOGIC_VECTOR((2*W-1) DOWNTO 0));
END COMPONENT fir_wrap;

COMPONENT fir_wrap2 IS
    	GENERIC(W:INTEGER:=16);
      PORT(reset: IN STD_LOGIC;
					 start: IN STD_LOGIC;
					 clk: IN STD_LOGIC;
           x: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
					 finish: OUT STD_LOGIC;
           y: OUT STD_LOGIC_VECTOR((2*W-1) DOWNTO 0));
END COMPONENT fir_wrap2;


SIGNAL x2: STD_LOGIC_VECTOR(2*W-1 DOWNTO 0);
SIGNAL start2: STD_LOGIC;

BEGIN

wrap: fir_wrap
      GENERIC MAP(W => W)
      PORT MAP (reset => reset,
                start => start,
                clk => clk,
                x => x,
				finish => start2,
                y => x2
          );


wrap2: fir_wrap2
      GENERIC MAP(W => W)         
     PORT MAP (reset => reset,
                start => start2,
				clk => clk,
                x => x2(2*W-1 downto W),
 				finish => finish,
                y => y
          );




  END iir_top_calc;
