-- program testowy do lfsr Blazej Wrobel, 250070, w11, informatyka
library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;


entity lfsr_tb is
end lfsr_tb;

architecture behaviour of lfsr_tb is

  -- komponent
  component lfsr
    port (
      clk : in std_logic;
      q : inout std_logic_vector(15 downto 0) := ( others => '0')
      );
  end component;

  -- sygnal zegara
  signal clk : std_logic := '0';
  -- rejestr
  signal q : std_logic_vector(15 downto 0);

  -- definiuje sygnaly - wyzszy i nizszy bajt (rejestr czytany od lewej do prawej)
  signal u_byte : std_logic_vector(7 downto 0);
  signal l_byte : std_logic_vector(7 downto 0);

  -- okres zegara
  signal clk_period : time := 20 ns;

begin

  -- tworze uut
  uut : lfsr port map(
    clk => clk,
    q => q
    );

  -- proces zegara
  clk_process : process
  begin

    clk <= '0';
    wait for clk_period/2;

    
    clk <= '1';
    wait for clk_period/2;
   -- pobieram bajty z sygnalu q
   u_byte(7 downto 0) <= q(15 downto 8);
   l_byte(7 downto 0) <= q(7 downto 0);

  end process;

  -- proces symulacji
  stim_process : process
  begin

    wait for 100 ns;

    wait;

  end process;

end;

              

    
  
    
    
      

  
  
