LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY fir1 IS
      GENERIC(WIDTH:INTEGER:=16;
              N:INTEGER:=16);
      PORT(reset: IN STD_LOGIC;
           start: IN STD_LOGIC;
           clk: IN STD_LOGIC;
           x:IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
           y:OUT STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0);
--         y:OUT STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
           finished:OUT STD_LOGIC);
   END fir1;
   
     
    ARCHITECTURE calc OF fir1 IS
      
      TYPE memory is array (0 to N) of
           std_logic_vector(WIDTH-1 DOWNTO 0);
           
      TYPE memory_2 is array (0 to N-1) of
           std_logic_vector(WIDTH-1 DOWNTO 0);
           
           
      --SIGNALS AND CONSTANTS
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
          --reset things

 --coefficients for 0.247000247(work)
         
          coefficients<= (
"0000000001000101", 
"0000000001101011", 
"0000000011000010", 
"0000000101011010", 
"0000001000111110", 
"0000001101101010", 
"0000010011010000", 
"0000011001011000", 
"0000011111100010", 
"0000100101000111", 
"0000101001100110", 
"0000101100011111", 
"0000101101011111", 
"0000101100011111", 
"0000101001100110", 
"0000100101000111", 
"0000011111100010", 
"0000011001011000", 
"0000010011010000", 
"0000001101101010", 
"0000001000111110", 
"0000000101011010", 
"0000000011000010", 
"0000000001101011", 
"0000000001000101" 
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
   

