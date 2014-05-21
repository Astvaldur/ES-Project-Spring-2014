--! @brief This the top-entity of the FIR decimation filter design. 
--! @details This code block is the top-entity of the decimation filter design. It
--! connects the two FIR filter stages. One filter stage consist of a wrapper 
--! for the filter and the FIR filter itself. Hence, this top-entity connects
--! the two filter wrappers (fir_wrap and fir_wrap2) and also connects the decimation filter design to the rest
--! of the system. Each of the two wrappers decimate by four, giving an overall decimation of 16 for the 
--! top-entity. The actual filter calculations are handled by the FIR filters (fir1 and fir2) which are sub-blocks of the wrappers.
--! @author Malin Eliasson
--! @version 2.0

--! Use standard library
LIBRARY ieee;
--! Use logic elements
USE ieee.std_logic_1164.ALL;
--! Use numeric elements
USE ieee.numeric_std.ALL;

 --! This top-entity of the FIR decimation filter design connects the decimation filter
 --! to the rest of the design through its inputs and outputs. 

ENTITY top_fir IS
		GENERIC(W:INTEGER:=16); --! Sets the width (number of bits) used for numbers in the decimation filter design
        PORT(reset: IN STD_LOGIC; --! Reset the decimation filter design
			 start: IN STD_LOGIC; --! Signal that tells the decimation filter design to start processing its input
			 clk: IN STD_LOGIC; --! Clock signal
             x: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0); --! Input to the decimation filter
			 finish: OUT STD_LOGIC; --! Output which is set to high when the decimation filter design has finished it calculation
             y: OUT STD_LOGIC_VECTOR((2*W-1) DOWNTO 0)); --! Output value of the decimation filter design
END top_fir;
  
--! @brief This is the architecture of the top-entity of the decimation filter design
--! @details This architecture of the top-entity of the decimation filter  design contains all the 
--! code which creates the functionality of the top-entity. It connects the two decimation stage wrappers
--! together and connects the inputs and outputs of the decimation filter design.

	
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
