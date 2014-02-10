-------------------------------------------------------
--! @file What is the name of the source file?
--! @brief short description. will end when a blank line or another sectioning command is parsed.
--! Give a description about the file
--! \author who created the this document. add another author command if your are several authors
--! \version what version is the code in.
--! \vhdlflow[flowchart title] this command should create a flow chart.
-------------------------------------------------------
 
--! Use standard library
library ieee;
--! Use logic elements
use ieee.std_logic_1164.all;

--! Mux entity brief description written after Use statement

-- Detailed description of this
-- mux design element. Placed just above entity

entity mux_using_with is
     port (
          din_0   : in  std_logic; 	--! Mux first input written next to the port
          din_1   : in  std_logic; 	--! Mux Second input written next to the port
          sel     : in  std_logic; 	--! Select input written next to the port
          mux_out : out std_logic  	--! Mux output input written next to the port
     );
end entity;

--! @brief brief description here about the architechture
--! @details Detailed description about the architecture of the mux.
architecture behavior of mux_using_with is
begin
          	with (sel) select
               mux_out <= din_0 when '0',
                    din_1 when others;
end architecture;
