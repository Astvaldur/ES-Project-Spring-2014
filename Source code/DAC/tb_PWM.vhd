

LIBRARY ieee;

USE work.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE std.textio.all; -- used for reading text files

ENTITY tb_PWM IS
  GENERIC(tb_width: INTEGER := 6;
          op_freq: INTEGER := 200_000;
          sys_clk: INTEGER := 100_000_000);
END	tb_PWM;

ARCHITECTURE bench OF tb_PWM IS

-- other signal declarations
constant size : integer := 64;   --adjust to test vector count
type sample_array IS ARRAY (size-1 DOWNTO 0) OF STD_LOGIC_VECTOR(tb_width-1 DOWNTO 0);  

  -- Functions --------------------------------------------------------------------------
  function bin (
    myChar : character)
    return std_logic is
    variable bin : std_logic;
  begin
    case myChar is
      when '0' => bin := '0';
      when '1' => bin := '1';
      when 'x' => bin := '0';
      when others => assert (false) report "no binary character read" severity failure;
    end case;
    return bin;
  end bin;

    function loadOperand (
    fileName : string)
    return sample_array is
    file objectFile : text open read_mode is fileName;
    variable memory : sample_array;
    variable L      : line;
    variable index  : natural := 0;
    variable myChar : character;
  begin
    while not endfile(objectFile) loop
      readline(objectFile, L);
      for i in tb_width-1 downto 0 loop -- 
        read(L, myChar);
        memory(index)(i) := bin(myChar);
      end loop;
      index := index + 1;
    end loop;
    return memory;
  end loadOperand;
  -- End Of Functions -----------------------------------------------------------------------

-- Importing pwm component to test.
COMPONENT PWM
   GENERIC(
        width   : integer ; -- bit resulution
        op_freq : integer ;
        sys_clk : integer);
    PORT(
    -- in
    vsample: in	std_logic_vector(width-1 downto 0); -- Sample
    --system
    reset : in std_logic;    -- system reset
    clk   : in std_logic;      -- System clock
    -- out
    ampPWM	: out	std_logic;
    ampSD   : out std_logic);
END COMPONENT; 

-- test bench signals
SIGNAL tb_clk : STD_LOGIC := '0';
SIGNAL tb_reset: STD_LOGIC := '1';
SIGNAL vsample_mem: sample_array := (OTHERS => (OTHERS => '0')); -- array of input
SIGNAL tb_vsample: STD_LOGIC_VECTOR (tb_width-1 DOWNTO 0) := (OTHERS => '0');
SIGNAL tb_pwm: STD_LOGIC;
SIGNAL tb_ampSD: STD_LOGIC;
SIGNAL tb_index: INTEGER := 0;   -- current index,to see this signal do not optimize design when simulating
SIGNAL tb_pwm_change: INTEGER; -- index where change happens

SIGNAL tb_sample_nr : INTEGER; -- index for the current sample used
SIGNAL tb_pwm_signal: STD_LOGIC := '0'; -- the test bench pwm signal. the component should match this one.

-- how many sys_clk in one pwm periods
CONSTANT period : INTEGER := sys_clk/op_freq; 

BEGIN

-- load the file with sample inputs
vsample_mem <= loadOperand(string'("output.txt"));

pwm_comp:PWM
  GENERIC MAP(width => tb_width,
              op_freq => op_freq,
              sys_clk => sys_clk)-- bit resulution
  PORT MAP(vsample => tb_vsample,
           reset => tb_reset,
           clk => tb_clk,
           ampPWM => tb_pwm,
           ampSD => tb_ampSD); --might need to add a signal here.


-- resets
tb_reset <= '1' ,
            '0' AFTER 1 ns,
            '1' AFTER 3 ns;


clk:PROCESS
-- clock process
BEGIN
  WAIT FOR 10 ns;
    tb_clk <= NOT (tb_clk);
END PROCESS;

testproc:PROCESS(tb_clk)
-- testing values
VARIABLE index: INTEGER := 0;
VARIABLE pwm_change: NATURAL;   -- Natural range is from 0 and up. what the index where the transition should happen
VARIABLE sample_index: NATURAL := 0;
VARIABLE current_sample: STD_LOGIC_VECTOR(tb_width-1 DOWNTO 0);
BEGIN
  IF(rising_edge(tb_clk)) THEN
    IF index = 0 THEN
      IF sample_index = size THEN
        -- we have gone through all samples and exit
        ASSERT(FALSE)
        REPORT "Test Bench Finsihed"
        SEVERITY FAILURE;
      END IF;
      --when the index is 0 we give a new sample
      current_sample := vsample_mem(sample_index);
      tb_vsample <= current_sample;
      tb_sample_nr <= sample_index;  
      -- increment sample index.
      sample_index := sample_index+1;
      
      -- calculate at which index pwm should change
      pwm_change := TO_INTEGER(UNSIGNED(current_sample))*period/(2**tb_width);
      tb_pwm_change <= pwm_change; -- give the index signal so it can be tracked in tb
      tb_pwm_signal <= '1'; -- set to high in the beginning of the cycle
    END IF;
    IF (index = pwm_change) THEN
      -- here the pwm signal should be one and on the next cycle it changes.
      ASSERT(tb_pwm = '1')
      REPORT "early pwm transistion"
      SEVERITY WARNING;
      
      -- set tb_pwm signal low here
      tb_pwm_signal <= '0'; 
    ELSIF (index = (pwm_change+1)) THEN
      -- check one index after pwm_change, not the pwm signal should be 1.
      --ASSERT(tb_pwm = '0')
      --REPORT "late pwm transistion"
      --SEVERITY WARNING;
    ELSIF (index = period-1) THEN
      -- the index is equal to the period so we reset it.
      index := -1; -- set it to -1 because post increment 
    END IF;
    --increment index
    index := index+1;
    tb_index <= index;
  END IF;

END PROCESS;

END bench;	