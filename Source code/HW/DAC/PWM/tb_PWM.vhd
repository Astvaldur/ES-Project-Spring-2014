

LIBRARY ieee;

USE work.all;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE std.textio.all; -- used for reading text files

ENTITY tb_PWM IS
  GENERIC(tb_width: INTEGER := 12;
          op_freq: INTEGER := 200_000;
          sys_clk: INTEGER := 100_000_000);
END	tb_PWM;

ARCHITECTURE bench OF tb_PWM IS

-- other signal declarations
constant size : integer := 2000;   --adjust to test vector count
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
CONSTANT period : INTEGER := (sys_clk/op_freq); 

BEGIN

-- load the file with sample inputs
vsample_mem <= loadOperand(string'("input_2k_12bits.txt"));

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
VARIABLE assert_index: INTEGER := 0;
VARIABLE pwm_change: NATURAL ;   -- Natural range is from 0 and up. what the index where the transition should happen
VARIABLE sample_index: NATURAL := 0;
VARIABLE current_sample: STD_LOGIC_VECTOR(tb_width-1 DOWNTO 0);
BEGIN
  IF(rising_edge(tb_clk)) THEN
    IF sample_index = size THEN
      -- we have gone through all samples and exit
      ASSERT(FALSE)
      REPORT "Test Bench Finsihed"
      SEVERITY FAILURE;
    END IF;    
    -- make the sample for the cycle available before the pwm period starts
    tb_vsample <= vsample_mem(sample_index); 
    IF index = 0 THEN
      -- at index zero a new sample is loaded
      current_sample := vsample_mem(sample_index);
      tb_sample_nr <= sample_index; -- indicate what sample we are on.
      sample_index := sample_index+1; -- increment sample index
      
      -- calculation of where the pwm should shift from 1 to 0.
      pwm_change := TO_INTEGER(UNSIGNED(current_sample))*period/(2**tb_width);
      tb_pwm_change <= pwm_change; -- output where the shift should occur this pwm period.
      
      -- set the pwm signal to 1.
      IF pwm_change /= 0 THEN
        -- if the change should not occur at index 0 then set pwm signal to 1
        tb_pwm_signal <= '1';
      ELSE
        -- if pwm_change is 0 then keep pwm signal at 0
        tb_pwm_signal <= '0';
      END IF;
      
      -- increment the index
      index := index+1;
      
    ELSIF index = pwm_change THEN
      -- switch signal from high to low at pwm_change index.
      tb_pwm_signal <= '0';
      
      IF index = period-1 THEN
        -- if the duty cycle is max then we have to reset index her as well
        index := 0;
      ELSE
        --increment index as well
        index := index+1;
      END IF;

      
    ELSIF index = period-1 THEN -- add -1 here or we get one extra clock cycle in the pwm period.
      -- we have gone through the period. reset index.
      index := 0;
    ELSE
      -- increment index
      index := index+1;
    END IF;
    assert_index := index-1; -- since the asserts are below the increments of index i use the assert index for readability 
    tb_index <= index; -- transfer index to tb for viewing.
    
    -- -1 is applied to the index since it has been incremented.
    -- Assert functions verifying functionality.
    IF pwm_change=0 AND assert_index=0 THEN -- special assert when there should be no pwm at all
      -- if the change is at zero check that the signal is 0.
      ASSERT(tb_pwm='0')
      REPORT("pwm was not low when index change was 0")
      SEVERITY WARNING;
    
    ELSIF (assert_index = pwm_change/2) THEN
      -- check if the pwm is high half way through the duty cycle.
      ASSERT(tb_pwm='1')
      REPORT("incorrect pwm value at index ") & INTEGER'IMAGE(index-1)
      SEVERITY WARNING;
      
    ELSIF assert_index = pwm_change THEN
      -- has the transistion occured at the right point, signal should go low this cycle
      ASSERT(tb_pwm='1') --asserting 1 since the signal will shift AFTER it has left the process.
      REPORT "Early pwm transistion at index " & INTEGER'IMAGE(index-1)
      SEVERITY WARNING;
    END IF;

  END IF;

END PROCESS;

END bench;	