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

  component PWM is
  generic (width   : integer  := 8; 				-- Bit resulution of the input bit vector
        op_freq : integer  := 200_000; 			--! The 2*frequency of the Pulses that we output.
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
  component dac_interface is
  generic(
    width : natural := 16
  );
  port(
    reset : in std_logic;
    sclk : in std_logic;

    data_input : in std_logic_vector(width-1 downto 0);
    write_data : in std_logic;
    DAC_shutdown : in std_logic_vector(1 downto 0);

    sync : out std_logic;
    DIN : out std_logic; -- SDI
    finished : out std_logic

  );
end component dac_interface;
component clk_enable is
    Generic(freq: integer:=24; half: integer:=12);
   port (reset : in std_logic; clk  : in std_logic; Enable : out std_logic);
end component clk_enable;

component DACapb is
  generic(
    --AMBA
    pindex      : integer := 0;
    paddr       : integer := 0;
    pmask       : integer := 16#fff#;
    width     : integer := 16;        -- Bit resulution of the input bit vector
    op_freq   : integer := 200_000        --! The 2*frequency of the Pulses that we output.
    );
  port (
    --AMBA
    rstn  : in  std_ulogic;
    clk   : in  std_ulogic;
    apbi  : in  apb_slv_in_type;
    apbo  : out  apb_slv_out_type;
    
    --PWM
    ampPWM  : out std_logic;          --! The ouput PWM signal, It is connected to the input of the filter. 
    ampSD : out std_logic;          --! We need to select the filter to be on.
    
    --DAC
    dac_sclk  : out  std_ulogic;       --! Serial clock
    dac_sync : out std_logic;
    dac_DIN : out std_logic -- SDI
  );                      
end component;

end;