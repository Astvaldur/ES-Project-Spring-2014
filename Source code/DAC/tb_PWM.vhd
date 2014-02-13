

LIBRARY ieee;

USE work.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE std.textio.all; -- used for reading text files

ENTITY tb_PWM IS
  GENERIC(WIDTH: INTEGER := 12;
          op_freq: INTEGER := 200_000;
          sys_clk: INTEGER := 100_000_000);
END	tb_PWM;

ARCHITECTURE bench OF tb_PWM IS

-- other signal declarations
constant size : integer := 1000;   --adjust to test vector count
type sample_array IS ARRAY (size DOWNTO 0) OF STD_LOGIC_VECTOR(WIDTH DOWNTO 0);  

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
      for i in 11 downto 0 loop -- 
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
        width   : integer  := 12; -- bit resulution
        op_freq : integer  := 200_000;
        sys_clk : integer  := 100_000_000);
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
SIGNAL tb_reset: STD_LOGIC;
SIGNAL vsample_mem: sample_array; -- array of input
SIGNAL tb_vsample: STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
SIGNAL tb_pwm: STD_LOGIC;

-- how many sys_clk in one pwm periods
CONSTANT period : INTEGER := sys_clk/op_freq; 

BEGIN

pwm_comp:PWM
  GENERIC MAP(width => WIDTH;
              op_freq => op_freq;
              sys_clk => sys_clk);-- bit resulution
  PORT MAP(vsample => tb_vsample;
           reset => tb_reset;
           clk => tb_clk;
           ampPWM => tb_pwm;
           ampSD => ); --might need to add a signal here.


-- resets
tb_reset <= '0' ,
            '1' AFTER 1 ns,
            '0' AFTER 3 ns;


clk:PROCESS
-- clock process
BEGIN
  WAIT FOR 10 ns;
    tb_clk <= NOT (tb_clk);
END PROCESS;

testproc:PROCESS(tb_clk)
-- testing values
VARIABLE index: INTEGER := 0;
VARIABLE pwm_change: INTEGER := 0;
VARIABLE sample_index: INTEGER := 0;
VARIABLE current_sample: STD_LOGIC_VECTOR(WIDTH -1 DOWNTO 0);
BEGIN
  IF(rising_edge(tb_clk)) THEN
    IF index = 0 THEN
      --when the index is 0 we give a new sample
      current_sample := vsample_mem(sample_index);
      tb_vsample <= current_sample;
      -- increment sample index.
      sample_index := sample_index+1;
      -- calculate at which index pwm should change
      pwm_change := conv_integer(current_sample)*period/(2**WIDTH);
    ELSIF (index = period) THEN
      -- the index is equal to the period so we reset it.
      index := -1; -- set it to -1 because post increment 
    ELSIF (index = pwm_change) THEN
      -- here the pwm signal should be one and on the next cycle it changes.
      ASSERT(tb_pwm = '1')
      REPORT "early pwm transistion"
      SEVERITY ERROR;
    ELSIF (index = (pwm_change+1)) THEN
      -- check one index after pwm_change, not the pwm signal should be 1.
      ASSERT(tb_pwm = '0')
      REPORT "late pwm transistion"
      SEVERITY ERROR;
    END IF;
    --increment index
    index := index+1;
  END IF;

END PROCESS;

END bench;	