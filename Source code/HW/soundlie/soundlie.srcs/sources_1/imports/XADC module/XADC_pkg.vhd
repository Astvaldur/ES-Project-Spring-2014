library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library grlib;
use grlib.amba.all;
use grlib.stdlib.all;

package XADC_pkg is

  component xadc_apb is
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

      --application specific
	  xadc_clk : in std_logic;
      xadc_vp : in  std_logic;
      xadc_vn : in  std_logic;
	  xadc_out : out std_logic_vector(15 downto 0)
    );
  end component xadc_apb;

  
  component interface_XADC is
  port (  xadc_clk : in std_logic;
            xadc_reset : in std_logic;
            xadc_vp : in  std_logic;
            xadc_vn : in  std_logic;     
            xadc_addr : in  std_logic_vector(6 downto 0);     
            xadc_eoc : out std_logic;
            xadc_eos : out std_logic;
            xadc_output : out std_logic_vector(15 downto 0)
  );
  end component interface_XADC;

end;

