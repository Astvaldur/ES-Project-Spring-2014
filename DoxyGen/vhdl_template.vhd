-------------------------------------------------------
--! @file vhdl_template.vhd
--! @brief short description of the code on this line.
--! @details Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
--! Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
--! when an unknown printer took a galley of type and scrambled it to make a type specimen book
--! \author who created the this document. add another author command if your are several authors
--! \version what version is the code in.
-------------------------------------------------------
 
--!Use standard library
library ieee;
--!Use logic elements
use ieee.std_logic_1164.all;

--! I motsättning till vad många tror, är inte Lorem Ipsum slumvisa ord. 
--! Det har sina rötter i ett stycke klassiskt litteratur på latin från 45 år före år 0, 
--! och är alltså över 2000 år gammalt.
entity vhdl_template_entity is
     port (
          din_0   : in  std_logic; 	--! Mux first input written next to the port
          din_1   : in  std_logic; 	--! Mux Second input written next to the port
          sel     : in  std_logic; 	--! Select input written next to the port
          mux_out : out std_logic  	--! Mux output input written next to the port
     );
end entity;


--! @details Det er en kendsgerning, at man bliver distraheret af 
--! læsbart indhold på en side, når man betragter dens layout. 
--! Meningen med at bruge Lorem Ipsum er, at teksten indeholder 
--! mere eller mindre almindelig tekstopbygning i modsætning til 
--! "Tekst her – og mere tekst her", mens det samtidigt ligner almindelig tekst. 
--! Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst.
architecture architecture_of_vhdl_template of vhdl_template_entity is
begin
          	with (sel) select
               mux_out <= din_0 when '0',
                    din_1 when others;
end architecture;
