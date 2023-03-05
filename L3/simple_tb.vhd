LIBRARY ieee;
library std;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use std.textio.all;

 
ENTITY simple_tb IS
END simple_tb;
 
ARCHITECTURE behavior OF simple_tb IS 
 
    -- UUT (Unit Under Test)
    COMPONENT simple
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : INOUT  unsigned(7 downto 0)
        );
    END COMPONENT;
    
   -- input signals
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

   -- input/output signal
   signal qq : unsigned(7 downto 0);

   -- set clock period 
   constant clk_period : time := 20 ns;
 
BEGIN
	-- instantiate UUT
   uut: simple PORT MAP (
          clk => clk,
          rst => rst,
          q   => qq
        );
   
   -- clock management process
   -- no sensitivity list, but uses 'wait'
   clk_process :PROCESS
   BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
   END PROCESS;
 

   -- stimulating process
   stim_proc: PROCESS
     variable my_line : line;
   BEGIN		
      -- let it run 
      wait for 100 ns;
      -- apply reset
      rst <= '1';
      -- czekam 700 ns, bo musi dodac 35 razy jedynke do licznika (t = 35*clk_period)
      wait for 700 ns;
      -- and let it go
      -- wypisuje wartosc licznika na wyjscie
      write(my_line, to_integer(qq));
      writeline(output, my_line);
      -- licznik znowu bedzie miec wartosc 160
      rst <= '0';
      -- czekam
      wait for 50 ns;
      --
      ---- rozpoczynam odliczanie
      rst <= '1';
      -- czekam 440 ns, bo musi teraz sie zmienic 22 razy (t = 22*clk_period)
      wait for 440 ns;
      -- wypisuje wartosc licznika
      write(my_line, to_integer(qq));
      writeline(output, my_line);
      wait;
   END PROCESS;	
END;
