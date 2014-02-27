library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library grlib;
use grlib.amba.all;
use grlib.stdlib.all;

package PWM_pkg is

  component PWMapb is
    generic(
      pindex      : integer := 0;
      paddr       : integer := 0;
      pmask       : integer := 16#fff#
      );
    port (
      rstn  : in  std_ulogic;
      clk   : in  std_ulogic;
      apbi   : in  apb_slv_in_type;
      apbo   : out apb_slv_out_type;

       --PWM
      pwm_clk	: in  std_ulogic;				--! System clock
      ampPWM	: out std_logic;  				--! The ouput PWM signal, It is connected to the input of the filter. 
      ampSD	: out std_logic   				--! We need to select the filter to be on.
    );
  end component PWMapb;

  component SKadder is
  generic ( size : natural := 32) ;                          -- size: Number of bits
  port ( A, B : in std_logic_vector ( size -1 downto 0 ) ;  -- A,B: addends
         S : out std_logic_vector ( size -1 downto 0 ) ;    -- S: Sum;
         Cout : out std_logic ) ;                           -- carry out
  end component SKadder ;

  component PWM is
  generic (width   : integer  := 8; 				-- Bit resulution of the input bit vector
        op_freq_2 : integer  := 200_000; 			--! The 2*frequency of the Pulses that we output.
        sys_clk : integer  := 100_000_000			--! The overall system clock
	);
  port (--! system
	reset : in std_logic;    				--! System reset, active low.
    	clk   : in std_logic;    				--! The clock input.
    	--! in
	vsample: in	std_logic_vector(width-1 downto 0); 	--! The PWM input signal.
    	--! out
	ampPWM	: out	std_logic;  				--! The ouput PWM signal, It is connected to the input of the filter. 
    	ampSD	: out	 std_logic  				--! We need to select the filter to be on.

	) ;
  end component PWM ;



end;

