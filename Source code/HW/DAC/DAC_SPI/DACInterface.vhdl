library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity dac_interface is
  generic(
    width : natural := 12
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
end entity;

architecture behavioural of dac_interface is
  
  type state_t is (sleep, config, data);

  type reg_t is record
    
    state : state_t;
    counter : natural range 0 to width;
    data_input : std_logic_vector(width-1 downto 0);
    DIN : std_logic;
    DAC_shutdown : std_logic_vector(1 downto 0);
    sync : std_logic;
    finished : std_logic;
  end record;

  signal r, rin : reg_t;
begin
  
  clocked_proc: process(reset, sclk)
  begin
    if reset = '1' then
      r.state <= sleep;
      r.counter <= 0;
      r.sync <= '1';
      r.DIN <= '0';
      r.finished <= '0';
    elsif rising_edge(sclk) then
      r <= rin;
    end if;
  end process; 

  combinatoric_proc: process(r, rin)
    variable v : reg_t;
  begin
    v := r;
    case r.state is
      when sleep =>
        v.counter := r.counter +1;
        if(r.counter=7) then
          v.data_input := std_logic_vector(unsigned(not(data_input(15))&data_input(14 downto 0))+1); 
          v.DAC_shutdown:=DAC_shutdown;
          v.finished := '0';
          v.state:=config;
          v.counter:=0;
          v.DIN:='0';
          v.sync:='0';
        else
          v.sync := '1';
        end if;
      
      when config =>
        v.counter := r.counter +1;
        -- shutdown bits
        if(r.counter=5)then
           v.DIN:=r.DAC_shutdown(1); -- Select 2x gain.
        elsif(r.counter=6)then
           v.DIN:=r.DAC_shutdown(0); -- Select 2x gain.
            v.state:=data;
            v.counter:=0;
        end if;

      when data =>
        v.counter := r.counter +1;
        v.DIN := r.data_input(width-1-r.counter);
        if(r.counter=15)then
           v.state:=sleep;
        end if ;

      when others =>
        v.state := sleep;
        v.sync := '1';
        v.data_input := (others => '0');
        v.finished := '1';
    end case;
    rin <= v;
  end process;
  
  finished <= r.finished;
  DIN <= r.DIN;
  sync <= r.sync;


end architecture;


