library ieee;

use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

-- Blazej Wrobel, 250070, 3. rok, W11, program testujacy uklad Xand
entity Xand_tb is
begin
end Xand_tb;

architecture behav of Xand_tb is

  component Xand is
    generic(width : integer);
    port(	clk	: in std_logic;
		A,B	: in std_logic_vector(width-1 downto 0);
		C	: out std_logic_vector(width-1 downto 0)
                );
  end component;
  signal A1 : std_logic_vector(11 downto 0) := "110011001100";
  signal A2 : std_logic_vector(3 downto 0) := "1001";
  signal B1 : std_logic_vector(11 downto 0) := "100000000000";
  signal B2 : std_logic_vector(3 downto 0) := "1100";
  signal clk : std_logic := '0';
  signal C1 : std_logic_vector(11 downto 0);
  signal C2 : std_logic_vector(3 downto 0);
begin
  Xand1 : Xand generic map(width => 12) port map(clk,A1,B1,C1);
  Xand2 : Xand generic map(width => 4) port map(clk,A2,B2,C2);
  process
  begin
    wait for 100 ns;
    
      
      assert C1 = B1
      report "bad vector C1" severity error;

    wait for 10 ns;

       
    assert C2 = "1000"
      report "bad vector C2" severity error;

    assert false report "end of test. It works !" severity note;

    wait;
    
   end process;
    
end behav;                                 
