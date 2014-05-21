--! @file DACInterface.vhd
--! @brief DAC interface is the VHDL code that generates the SPI message from the data sample.
--! @details The SPI for the DAC needs it sample in a very clear format which is described by the
--! AD5062 Data sheet. This code generates the message needed with the two process method and
--! outputs the message. The message is generated constantly from the newest awailable sample.

--! @author Ástvaldur Hjartarson
--! @version 1.0

library ieee;--! Use standard library
use ieee.std_logic_1164.ALL;--! Use ieee 1164 standard for logic elements.
use ieee.numeric_std.ALL;--! Use ieee numeric standard


--! Ports
entity dac_interface is
  generic(
    width : natural := 16 --!  Generic for the width of the communications.
  );
  port(
    --! Inputs
    reset : in std_logic; --! system reset input, restart is active low('0').
    sclk : in std_logic; --! The serial interface clock generated for the SPI.

    data_input : in std_logic_vector(width-1 downto 0);--! The data 16 bit sample that is to be send. 
    write_data : in std_logic; --! A  signal from wrapper to tell when a new sample should be sent to the DAC.
    DAC_shutdown : in std_logic_vector(1 downto 0); --! Configuration bits for the DAC modes, future work part.
    --! Output
    sync : out std_logic; --!  Synchronization  signal.
    DIN : out std_logic;  --!  Serial Data signal.
    finished : out std_logic --! Telling the wrapper when we have finished sending the sample.
  );
end entity;


--! @brief This the DAC SPI interface architecture.
--! @details The code is developed with the two process method to generate the
--! desired communication message.

architecture behavioural of dac_interface is
  
  type state_t is (sleep, config, data);

  type reg_t is record
    
    state : state_t;
    counter : natural range 0 to width+2;
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
    if reset = '0' then
      r.state <= sleep;
      r.counter <= 0;
      r.sync <= '1';
      r.DIN <= '0';
      r.finished <= '1';
    elsif rising_edge(sclk) then
      r <= rin;
    end if;
  end process; 

  combinatoric_proc: process(r, rin, write_data)
  variable v : reg_t;
  begin
    v := r;
    case r.state is
      when sleep =>
        if(write_data='1') then
          v.finished :='0';
          v.data_input := data_input; 
          v.DAC_shutdown:=DAC_shutdown;
          v.state:=config;
          v.counter:=0;
          v.DIN:='0';
          v.sync:='0';
        else
          v.sync := '1';
        end if;
      
      when config =>
        v.counter := r.counter +1;
        -- 6 empty bits then
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
       if(r.counter <= 15)THEN
          v.DIN := r.data_input(width-1-r.counter);
        elsif(r.counter=16)then
           v.sync:='1';
        elsif(r.counter=18)then
          v.finished :='1';
          v.state:=sleep;
        end if;

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


