library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity top_level is
  generic(
    width : integer := 16;
    sclk_freq : integer := 100
  );
  port(
    reset : in std_logic;
    clk : in std_logic;
    
    switch  : in std_logic_vector(1 downto 0);
    --ADC
    vauxn3 : in  std_logic;
    vauxp3 : in  std_logic;
    --DAC
    dac_sync : out std_logic;
    dac_DIN  : out std_logic; 
    dac_sclk : out std_logic;
    --PWM
    ampPWM : out std_logic;
    ampSD : out std_logic;
    
    led : out std_logic_vector(15 downto 0)
  );
end entity;

architecture rtl of top_level is
  
--ADC signals
signal di_in_top : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal daddr_in_top: STD_LOGIC_VECTOR(6 DOWNTO 0);
signal den_in_top : STD_LOGIC;
signal dwe_in_top : STD_LOGIC;
signal drdy_out_top : STD_LOGIC;
signal do_out_top : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal dclk_in_top : STD_LOGIC;
signal reset_in_top : STD_LOGIC;
signal vp_in_top : STD_LOGIC;
signal vn_in_top : STD_LOGIC;
signal channel_out_top : STD_LOGIC_VECTOR(4 DOWNTO 0);
signal eoc_out_top : STD_LOGIC;
signal alarm_out_top : STD_LOGIC;
signal eos_out_top : STD_LOGIC;
signal busy_out_top : STD_LOGIC;
signal clk_adc : STD_LOGIC;
signal finish : STD_LOGIC;


--------------- Fir signals
signal bus_fir:  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal bus_mid_fir:  STD_LOGIC_VECTOR(width-1 DOWNTO 0);
signal finish_fir: std_logic;

-- DAC signals
signal dac_input : std_logic_vector(width-1 downto 0);
signal sclk : std_logic;
constant DAC_shutdown : std_logic_vector(1 downto 0):= "00";

------------------------------
COMPONENT xadc_wiz_0
  PORT (
    di_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    daddr_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    den_in : IN STD_LOGIC;
    dwe_in : IN STD_LOGIC;
    drdy_out : OUT STD_LOGIC;
    do_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    dclk_in : IN STD_LOGIC;
    reset_in : IN STD_LOGIC;
    vp_in : IN STD_LOGIC;
    vn_in : IN STD_LOGIC;
    vauxp3 : IN STD_LOGIC;
    vauxn3 : IN STD_LOGIC;
    channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    eoc_out : OUT STD_LOGIC;
    alarm_out : OUT STD_LOGIC;
    eos_out : OUT STD_LOGIC;
    busy_out : OUT STD_LOGIC
  );
END COMPONENT;
  
component PWM is
   GENERIC(
        width   : integer  := 9); -- Bit resulution of the input bit vector
    PORT(
    reset : in std_logic;    --! System reset, active low.
    clk   : in std_logic;    --! The clock input.
    vsample: in	std_logic_vector(width-1 downto 0); --! The PWM input signal.
    ampPWM	: out	std_logic--;  --! The ouput PWM signal, It is connected to the input of the filter. 
    );
end component;
  ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
  ATTRIBUTE SYN_BLACK_BOX OF xadc_wiz_0 : COMPONENT IS TRUE;
  ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
  ATTRIBUTE BLACK_BOX_PAD_PIN OF xadc_wiz_0 : COMPONENT IS "di_in[15:0],daddr_in[6:0],den_in,dwe_in,drdy_out,do_out[15:0],dclk_in,reset_in,vp_in,vn_in,vauxp3,vauxn3,channel_out[4:0],eoc_out,alarm_out,eos_out,busy_out";
  -------------------------------
signal dac_sync1 : std_logic:='0';
signal dac_DIN1 : std_logic:='0';

begin
led(15 downto 2)<=bus_fir(31 downto 18);
led(1) <=dac_DIN1;
dac_DIN<=dac_DIN1;
led(0) <=dac_sync1;
dac_sync <= dac_sync1;
clk_adc <= not clk;
dac_sclk<=sclk;
ampSD<=switch(1);
process(clk,reset)
begin

  if(reset = '1') then
    di_in_top <= "0000000000000000";
    daddr_in_top <= "0010011";
    dwe_in_top <= '0';
    den_in_top <= '0';
    
  elsif(rising_edge(clk)) then
    di_in_top <= "0000000000000000";
    daddr_in_top <= "0010011";
    dwe_in_top <= '0';
    den_in_top <= eoc_out_top;
  end if;
end process;

slck_gen: entity work.clk_enable 
  Generic map(freq => sclk_freq,
             half =>  (sclk_freq/2))
  port map(
      reset => reset,
      clk  =>clk,
      Enable =>sclk
      );


adc_0 : xadc_wiz_0
  PORT MAP (
    di_in => di_in_top,
    daddr_in => daddr_in_top,
    den_in => den_in_top,
    dwe_in => dwe_in_top,
    drdy_out => drdy_out_top,
    do_out => do_out_top,
    dclk_in => clk_adc,
    reset_in => reset,
    vp_in => '0',
    vn_in => '0',
    vauxp3 => vauxp3,
    vauxn3 => vauxn3,
    channel_out => channel_out_top,
    eoc_out => eoc_out_top,
    alarm_out => alarm_out_top,
    eos_out => eos_out_top,
    busy_out => busy_out_top
  );
--

fir:  entity work.top_fir 
     GENERIC map(W=>width)
     PORT map(reset=> reset,
         start=>eoc_out_top,
         clk=>clk,
         x=>do_out_top,
         finish=>finish_fir,
         y=>bus_fir);
         
PWM_instance:PWM
    generic map(width => 9)
     PORT MAP(
        reset=> reset,-- : in std_logic;    --! System reset, active low.
        clk => clk,--   : in std_logic;    --! The clock input.
        vsample=>bus_fir(31 downto 23),--: in	std_logic_vector(width-1 downto 0); --! The PWM input signal.
        ampPWM=>ampPWM	--: out	std_logic--;  --! The ouput PWM signal, It is connected to the input of the filter.
     );
     
dac: entity work.dac_interface
  generic map(width => width)
  port map(
    reset => reset,
    sclk => sclk,
    data_input => bus_fir(31 downto 16),
    write_data => finish_fir,
    DAC_shutdown => DAC_shutdown,
    sync => dac_sync1,
    DIN  => dac_DIN1);

end architecture;