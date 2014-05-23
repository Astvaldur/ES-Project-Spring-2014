--! @brief This is the wrapper for the second filter stage of the FIR decimation filter design. 
--! @details This code block is a wrapper which connects the second stage FIR filter (fir2)
--! to the top-entity of the decimation filter design (top_fir). 
--! @author Malin Eliasson
--! @author Astvaldur Hjartarson
--! @version 2.0

--! Use standard library
LIBRARY ieee;
--! Use logic elements
USE ieee.std_logic_1164.ALL;
--! Use numeric elements
USE ieee.numeric_std.ALL;

 --! This wrapper entity takes inputs from the top-entity of the decimation filter design (top_fir).
 --! It also outputs signals to top_fir. The outputs of the wrapper are generated by the FIR filter sub-block (fir2) connected to the wrapper.
 
ENTITY fir_wrap2 IS
			GENERIC(W:INTEGER:=16); --! Sets the width (number of bits) used for numbers in the wrapper
      PORT(reset: IN STD_LOGIC;  --! Reset the wrapper
					 start: IN STD_LOGIC; --! Signal that tells the wrapper to start processing its input
					 clk: IN STD_LOGIC; --! Clock signal
           x: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0); --! Input to the wrapper
					 finish: OUT STD_LOGIC; --! Finish signal which is set to high when the wrapper is finished
           y: OUT STD_LOGIC_VECTOR((2*W-1) DOWNTO 0)); --! Output result of the wrapper
END fir_wrap2;

--! @brief This is the architecture of the second wrapper of the second decimation stage of the decimation filter design.
--! @details This architecture of the second wrapper of the second decimation stage contains all the 
--! code which describes the functionality of the wrapper. It contains a FIR filter sub-block, fir2, which does
--! the filter calculation. The wrapper takes the output from the filter and sends it to the top-entity. 

   
    ARCHITECTURE fir_wrap_calc OF fir_wrap2 IS
		
COMPONENT fir2 IS
    GENERIC(WIDTH:INTEGER:=16;
              N:INTEGER:=16);
      PORT(reset: IN STD_LOGIC;
           start: IN STD_LOGIC;
           clk: IN STD_LOGIC;
           x:IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
           y:OUT STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0);
           finished:OUT STD_LOGIC);
END COMPONENT fir2;
	

SIGNAL x_s : STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL y_s : STD_LOGIC_VECTOR(35 DOWNTO 0);
SIGNAL x_zeros: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL x_ones : STD_LOGIC_VECTOR(1 downto 0); 
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
			 x_ones <= (OTHERS => '1');
			 finish <= '0';
			 start_iir <= '0';
			 fin_counter <= 0;
			 y<=(OTHERS => '0');
			 started<='0';

		ELSIF (start='1' AND started='0') THEN

		
				IF x(15)='0' THEN
				  x_s <= x & x_zeros; 
				ELSE 
				  x_s <= x & x_ones; 
				END IF;
				
			
				start_iir <='1';
				fin_counter <= fin_counter+1;
				
				finish <= '0';
				
				IF (fin_counter=3) THEN
					finish <='1';
					fin_counter <=0;
					y <= y_s(35 downto 4);
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
      GENERIC MAP(WIDTH => 18,     
                   N => 100)         
      PORT MAP (reset => reset,
                start => start_iir,
					      clk => clk,
                x => x_s,
                y => y_s,
								finished=>fin
          );


  END fir_wrap_calc;