-- Blazej Wrobel, w11, informatyka, 250070
library std;
library ieee;
use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity shift_register is
  port(
    clk : in std_logic;
    -- wartosc poczatkowa - ziarno
    q : inout std_logic_vector(15 downto 0) := ( others => '0')
    );

end shift_register;

architecture behaviour of shift_register is
begin

  process
  begin
          -- przesuwamy rejestr o 1 miejsce
          q(15 downto 1) <= q(14 downto 0);
          -- obliczamy nowy bit zerowy - xor 1,4 i 15 bitu
          q(0) <= q(1) xor q(4) xor q(15);
          -- proces zawieszamy dopoki nie bedzie zbocza rosnacego
          wait until clk'event and clk = '1';
          
  end process;
          
end behaviour;
