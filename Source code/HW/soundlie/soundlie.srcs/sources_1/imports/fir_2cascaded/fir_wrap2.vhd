


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ENTITY fir_wrap2 IS
			GENERIC(W:INTEGER:=16);
      PORT(reset: IN STD_LOGIC;
					 start: IN STD_LOGIC;
					 clk: IN STD_LOGIC;
           x: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
					 finish: OUT STD_LOGIC;
           y: OUT STD_LOGIC_VECTOR((2*W-1) DOWNTO 0));
END fir_wrap2;
   
    ARCHITECTURE fir_wrap_calc OF fir_wrap2 IS
		
COMPONENT fir2 IS
    GENERIC(WIDTH:INTEGER:=16;
              N:INTEGER:=16);
      PORT(reset: IN STD_LOGIC;
           start: IN STD_LOGIC;
           clk: IN STD_LOGIC;
           x:IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
           y:OUT STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0);
--         y:OUT STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
           finished:OUT STD_LOGIC);
END COMPONENT fir2;
	

SIGNAL x_s : STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL y_s : STD_LOGIC_VECTOR(2*W-1 DOWNTO 0);
SIGNAL x_zeros: STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SIGNAL start_iir: STD_LOGIC;
SIGNAL fin_counter: INTEGER;
SIGNAL fin:STD_LOGIC;
SIGNAL started:STD_LOGIC;

	BEGIN


PROCESS (clk)
	BEGIN

  IF (rising_edge(clk)) THEN

		IF (reset='1') THEN
			 x_zeros <= (OTHERS => '0');
			 finish <= '0';
			 start_iir <= '0';
			 fin_counter <= 0;
			 y<=(OTHERS => '0');
			 started<='0';

		ELSIF (start='1' AND started='0') THEN
				x_s <= x;
				start_iir <='1';
				fin_counter <= fin_counter+1;
				
				finish <= '0';
				
				IF (fin_counter=3) THEN
					finish <='1';
					fin_counter <=0;
					y <= y_s;
				END IF;
				
				started<='1';

    ELSIF (start='0' AND start_iir='1') THEN
			  start_iir <='0';
				finish <='0';
				started<='0';
				
	ELSE 
			finish <= '0';	
   	END IF;

	END IF;

 END PROCESS; 


 fir_comp: fir2
      GENERIC MAP(WIDTH => 16,     --number of bits of variables and data in calculations
                   N => 24)         --order of filter
      PORT MAP (reset => reset,
                start => start_iir,
					      clk => clk,
                x => x_s,
                y => y_s,
								finished=>fin
          );


  END fir_wrap_calc;