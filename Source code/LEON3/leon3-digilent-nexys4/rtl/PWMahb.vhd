-- Standard
library std;
use std.textio.all;

-- IEEE
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;


-- Grlib
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

--Work
library work;
use work.PWM_pkg.all;

entity PWMahb is
  generic(  
    -- This is for the PWM
    width   : integer  := 8; 
    op_freq : integer  := 200_000;  
    sys_clk : integer  := 100_000_000;     
    -- This is for the High speed bus
    hindex      : integer := 0;
    haddr       : integer := 0;
    hmask       : integer := 16#fff#
    );
  port (
    -- system
    rstn  : in  std_ulogic; 				-- clean register, restart devce
    clk   : in  std_ulogic; 				-- clock for the PWM system
    -- Input
    ahbsi : in ahb_slv_in_type;				-- Slave input
    -- Output
    ahbso : out ahb_slv_out_type;			-- Slave output

    --PWM
    pwm_clk : in  std_ulogic;				--! System clock
    ampPWM : out std_logic;
    ampSD: out std_logic
  );
end entity PWMahb;

architecture rtl of PWMahb is
----------------------------------------------------------------------
--------------Software interface    
----------------------------------------------------------------------  
-- This interface is a slave one since this is a slave.

-- This is the config file for addressing. 
--constant REVISION       : amba_version_type := 0;
  constant hconfig        : ahb_config_type := (                       0 => ahb_device_reg ( VENDOR_OPENCORES, GAISLER_GPREG, 0, 0, 0),4 => ahb_iobar(haddr, hmask),others => zero32); 
  -- This line needed as there are eight 32-bit words
--------------------------------------------------------
----------------------------------------------------
 

  -- PWM related signals----------------------------
  type PWM_registers is record
    vsample : std_logic_vector(width-1 downto 0);
  end record;

  -- AHB related signals----------------------------
  type reg_type is record
    hwrite     : std_ulogic; -- write
    hready     : std_ulogic; -- ready
    hsel       : std_ulogic; -- select
    addr       : std_logic_vector(3 downto 2);--address
  end record;

  
   --Registers------------------------------------------
  signal ahb_reg , ahb_reg_in   : PWM_registers;
  signal r, c       : reg_type;

  -- Internal signals

begin


--------------------------------------------------------------------
 -- combinatorial process
--------------------------------------------------------------------
  ahb_comb : process(rstn, ahb_reg, ahbsi, r)
    
    -- Variable registers
    variable h       : PWM_registers;
    variable v       : reg_type;

    -- variables for communications
    variable my_line : line;
    variable haddr   : std_logic_vector(3 downto 2);
    variable hrdata  : std_logic_vector(31 downto 0);

  begin
   -- -- 2 process model sync -- -- -- --
   h         := ahb_reg;
   v         := r;
   v.hready  := '1';
  -- -- -- -- -- -- -- -- -- -- -- -- -- --
  -- Communitaction Logic ------------------------ 
  -- Is there a new address?
  if (r.hwrite or not r.hready) = '1' then
    haddr    := r.addr;
  else --
    haddr    := ahbsi.haddr(3 downto 2); -- address bus(byte) 32 bits
  end if;

  -- Slave register logic ------------------------
  if ahbsi.hready = '1' then
    v.hsel   := ahbsi.hsel(hindex) and ahbsi.htrans(1);--slave select and transfer type
    v.hwrite := ahbsi.hwrite and v.hsel; -- read/write and (not slave) select
    v.addr   := ahbsi.haddr(3 downto 2); --address bus (byte) 32 currently
    if v.hsel = '1' and ahbsi.hwrite = '0' then
        v.hready := '0';
    end if;
  end if;

  -- Write to registers--------------------------------------
  if r.hwrite = '1' then
     case r.addr is
     when "00" =>
         h.vsample   := ahbsi.hwdata(width-1 downto 0);--see what is on write data bus and store it in register.
     when others => null;
     end case;
    v.hready := not (v.hsel and not ahbsi.hwrite);--select device and read/write
    v.hwrite := v.hwrite and v.hready;
  end if;
  
   -- Read registers--------------------------------------
  case r.addr is         
    when "00" =>
      hrdata(width-1 downto 0) := ahb_reg.vsample;--  puts the register value on the bus.
    when others => null;
  end case;
  
  -- Output data
  ahbso.hrdata <= ahbdrivedata(hrdata);--read data bus, and we are writing to it.
  ahbso.hready <= r.hready;-- transfer done signal

   -- Reset registers--------------------------------------
   if rstn = '0' then
     h.vsample   := (others => '0');
     v.hwrite    := '0'; 
     v.hready    := '1'; 
   end if;

   c <= v; 
   ahb_reg_in.vsample <= h.vsample;
   
 end process;

 ----------------------------------------------------------
 -- Sequential process
 ----------------------------------------------------------
 regs: process (clk)
 begin
   if rstn = '0' then
     ahb_reg.vsample <= (others => '0');
   elsif rising_edge(clk) then
     ahb_reg <= ahb_reg_in;
     r       <= c;  
   end if;
 end process;



 ----------------------------------------------------------
 -- Set AHB output bus signals
 ----------------------------------------------------------
 -- ahbso.ready  --transfer done signal
 ahbso.hresp   <= "00";            -- Response is ok -- response type 2 bits
 -- ahbso.hrdata  --read data bus
 ahbso.hsplit  <= (others => '0'); -- No slave requires split transfer
 ahbso.hirq    <= (others => '0'); -- No IRQ -- This is the interupt bus
 ahbso.hconfig <= hconfig;         -- VHDL Constant --memory access reg.
 ahbso.hindex  <= hindex;          -- VHDL Generic --for diagnostic use only

 -- ahbso.hcache  <= '0';           -- Not Cacheable -- this is extra


--------------------------------------------------------------------
 ---- PWM port map & instantiation -------
--------------------------------------------------------------------
 PWM_comp : entity work.PWM
 generic map(
    	width => width,
    	op_freq =>op_freq,
    	sys_clk =>sys_clk)
    PORT map(
	reset  =>rstn,  	
    	clk    =>pwm_clk, 
	vsample=>ahb_reg_in.vsample,
	ampPWM =>ampPWM,  
    	ampSD =>ampSD
    );
 ampSD<='0';-- Active low is on
--------------------------------------------------------------------
  -- pragma translate_off   
--------------------------------------------------------------------
  bootmsg : report_version 
  generic map ("ahbvgreport_versiona" & tost(hindex) & ": Adder Control rev 0");
  -- pragma translate_on

end rtl;

