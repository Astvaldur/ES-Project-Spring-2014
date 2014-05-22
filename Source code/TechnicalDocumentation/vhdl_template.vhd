--! @file vhdl_template.vhd
--! @brief short description of the code on this line. 
--! @details Lorem Ipsum is simply dummy text of the printing and typesetting industry.    
--! the details section can be several lines compared to brief which should be one.
--! if several authors made the file just add another author command.
--! All the comments upp here will be placed in the file reference tab. Files -> Filename
--! @author David Alm
--! @author David Victor Alm
--! @version 2.0

  
--! Use standard library
library ieee;
--! Use logic elements
use ieee.std_logic_1164.all;

 --! This mux is fantastic! wow! so much mux!
 --! It muxes this and that and it's awsome!
    entity mux_using_with is
        port (
            din_0   : in  std_logic;  --! Mux first input written next to the port
            din_1   : in  std_logic;  --! Mux Second input written next to the port
            sel     : in  std_logic;    --! Select input written next to the port
            mux_out : out std_logic  --! Mux output input written next to the port
        );
    end entity;
    
    --! @brief minimal architecture description
    --! @details Det er en kendsgerning, at man bliver distraheret af 
    --! this architecture is good good. much wow!
    architecture behavior of mux_using_with is
   begin
   with (sel) select
   mux_out <= din_0 when '0',
   din_1 when others;
end architecture;