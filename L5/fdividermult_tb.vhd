library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity fdividermult_tb is
end fdividermult_tb;

architecture Behavioral of fdividermult_tb is

  component fdividermult
     generic(NOuts : Positive := 3);
     port(
    clk : in std_logic;
    output : out unsigned(NOuts-1 downto 0) := (others => '1')
    );
  end component;

  signal clk : std_logic := '0';
  signal output : unsigned(4 downto 0) := (others => '1');

  constant clk_period : time := 8 ns;
                              
begin

  uut : fdividermult
    generic map(
      NOuts => 5)
    port map(
      clk => clk,
      output => output);

  clk_process : process
  begin

    clk <= '1';
    wait for clk_period/2;

    clk <= '0';
    wait for clk_period/2;

  end process;

  stim_process : process
  begin

    wait;

  end process;
      

end Behavioral;
