--!@file fir2.vhd
--! @brief This is the FIR filter implementation of the second stage filter in the decimation filter design. 
--! @details This code block is a FIR filter. It is the second filter in the two stage decimation 
--! filter design. It is a sub-block of a wrapper, fir_wrap2.
--! @author Malin Eliasson
--! @author Astvaldur Hjartarson
--! @version 2.0


--! Use standard library
LIBRARY ieee;
--! Use logic elements
USE ieee.std_logic_1164.ALL;
--! Use numeric elements
USE ieee.numeric_std.ALL;

 --! This FIR entity takes input from the fir_wrap2 block. It also outputs its calculated 
 --! results to the fir_wrap2 block.
 
ENTITY fir2 IS
      GENERIC(WIDTH:INTEGER:=16; --! Sets the width (number of bits) used for numbers in the filter
              N:INTEGER:=16);  --! Sets the order of the FIR filter
      PORT(reset: IN STD_LOGIC; --! Reset the FIR filter
           start: IN STD_LOGIC; --! Signal that tells the FIR filter to start processing its input
           clk: IN STD_LOGIC; --! Clock signal
           x:IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0); --! Input to the FIR filter
           y:OUT STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0); --! Output results of the FIR filter
           finished:OUT STD_LOGIC); --! Output which is set to high when the FIR filter has finished it calculation
   END fir2 ;
   
--! @brief This is the architecture of the FIR filter of the second stage of the decimation filter design
--! @details This architecture of the FIR filter contains
--! code which describes the functionality of the filter. The filter calculates
--! the output by multiplying the inputs with the filter coefficients. 
     
    ARCHITECTURE calc OF fir2 IS
      
      TYPE memory is array (0 to N) of
           std_logic_vector(WIDTH-1 DOWNTO 0);
           
      TYPE memory_2 is array (0 to N-1) of
           std_logic_vector(WIDTH-1 DOWNTO 0);
           

      SIGNAL coefficients:memory;
      
      
      SIGNAL x_n:memory_2; 
      SIGNAl y_sum:std_logic_vector(2*WIDTH-1 DOWNTO 0);
      SIGNAL start_2:STD_LOGIC;
      SIGNAl fin:STD_LOGIC;
      SIGNAL i:INTEGER;
      
       BEGIN
                            
    PROCESS (reset,clk)
      BEGIN   
         IF (reset='1') THEN

 
                   coefficients<= ("111111111111111100",
         "111111111111111100",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000001",
         "000000000000000001",
         "111111111111111100",
         "111111111111111110",
         "111111111111111001",
         "111111111111111010",
         "111111111111111000",
         "111111111111111101",
         "000000000000000010",
         "000000000000000011",
         "000000000000000010",
         "111111111111111101",
         "111111111111111110",
         "000000000000000001",
         "000000000000001000",
         "000000000000001101",
         "000000000000001011",
         "000000000000000100",
         "111111111111111100",
         "000000000000000111",
         "000000000000011010",
         "000000000000101100",
         "000000000000101010",
         "000000000000001110",
         "111111111111110011",
         "111111111111111111",
         "000000000001001101",
         "000000000010111011",
         "000000000010111110",
         "111111111110011100",
         "111111110011111010",
         "111111100101010010",
         "111111011001110110",
         "111111011100110111",
         "111111111001100001",
         "000000110101110010",
         "000010001101000010",
         "000011101111010101",
         "000101000101001100",
         "000101110111011000",
         "000101110111011000",
         "000101000101001100",
         "000011101111010101",
         "000010001101000010",
         "000000110101110010",
         "111111111001100001",
         "111111011100110111",
         "111111011001110110",
         "111111100101010010",
         "111111110011111010",
         "111111111110011100",
         "000000000010111110",
         "000000000010111011",
         "000000000001001101",
         "111111111111111111",
         "111111111111110011",
         "000000000000001110",
         "000000000000101010",
         "000000000000101100",
         "000000000000011010",
         "000000000000000111",
         "111111111111111100",
         "000000000000000100",
         "000000000000001011",
         "000000000000001101",
         "000000000000001000",
         "000000000000000001",
         "111111111111111110",
         "111111111111111101",
         "000000000000000010",
         "000000000000000011",
         "000000000000000010",
         "111111111111111101",
         "111111111111111000",
         "111111111111111010",
         "111111111111111001",
         "111111111111111110",
         "111111111111111100",
         "000000000000000001",
         "000000000000000001",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "000000000000000000",
         "111111111111111100",
         "111111111111111100"
);

                          

                          
          y_sum<=(OTHERS=>'0');
         
          for k in 0 to N-1 loop
             x_n(k)<=(OTHERS=>'0');
          end loop;
          
          start_2<='0';
          fin<='0';
          i<=0;
					finished<='0';
          
         ELSIF (rising_edge(clk)) THEN
           
            IF (start='1' AND start_2='0') THEN
                  
                  x_n(0)<=x;
                  y_sum<=(OTHERS=>'0');
                  start_2<='1';
                  i<=0;
									finished<='0';
									fin<='0';
			                  
            ELSIF (start_2='1' AND fin='0') THEN
               
              y_sum<=std_logic_vector(signed(y_sum)+
              signed(shift_left(signed(signed(coefficients(i))*signed(x_n(i))),1)));
              
              i<=i+1;
              
              IF (i=N-1) THEN
                fin<='1';
              END IF;
      
           ELSIF (start_2='1' AND fin='1' )THEN
             
             y<=y_sum;
             
            for j in 0 to N-2 loop
             x_n(j+1)<=x_n(j);
            end loop;
            
            finished<='1';
            start_2<='0';
            fin<='0';
            
            END IF;
          END IF;
    END PROCESS; 
            
            
END calc; 
   

