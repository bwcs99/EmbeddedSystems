-- Blazej Wrobel, program testowy do zadania 5, 250070, 3. rok, w11

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zadanie5_tb is
begin
end zadanie5_tb;

architecture Test of zadanie5_tb is

  component zadanie5 is
    generic(width : integer);
    port(
      a : in std_logic_vector(width-1 downto 0);
      b : in std_logic_vector(width-1 downto 0);
      c : in std_logic_vector(width-1 downto 0);
      d : in std_logic_vector(width-1 downto 0);
      x : out std_logic_vector(width-1 downto 0)
      );
  end component;

  signal a1 : std_logic_vector(2 downto 0) := "101";
  signal b1 : std_logic_vector(2 downto 0) := "000";
  signal c1 : std_logic_vector(2 downto 0) := "111";
  signal d1 : std_logic_vector(2 downto 0) := "010";
  signal x1 : std_logic_vector(2 downto 0);

  signal ans : std_logic_vector(2 downto 0) := "111";

begin

  UUT : zadanie5 generic map(width => 3) port map(a1, b1, c1, d1, x1);

  process
  begin

    wait for 5 ns;

    assert x1 = ans report "bad ouput vector !" severity error;

    assert false report "end of test. Success !" severity note;

    wait;
  end process;
   

end Test;


    
      
      

