library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fdivider_tb is
end fdivider_tb;

architecture behavioral of fdivider_tb is

  component fdivider
   generic(NBit : Positive := 8 ; Divider : Integer := 1);
   port( clk : in std_logic;
        output : out std_logic := '1'
         );
  end component;

  signal clk : std_logic := '1';
  signal output : std_logic := '1';

  constant clk_period : time := 8 ns;
  
begin

--  uut1 : fdivider
--    generic map(
--      NBit => 22,
--      Divider => 125_000_0)
--    port map(
--      clk => clk,
--      output => output);
  
--  uut2 : fdivider
--    generic map(
--      NBit => 18,
--      Divider => 113636)
--     port map(
--      clk => clk,
--      output => output);

   uut3 : fdivider
    generic map(
      NBit => 2,
      Divider => 2)
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

  stim_proc1 : process
  begin

    wait;

  end process;
  
end behavioral;
