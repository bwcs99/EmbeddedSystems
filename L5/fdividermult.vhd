library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity fdividermult is
  
  generic(NOuts : Positive := 3);
  
  port(
    clk : in std_logic;
    output : out unsigned(NOuts-1 downto 0) := (others => '1')
    );

end fdividermult;

architecture Behavioral of fdividermult is
  
  constant clk_frequency : Positive := 125_000_000;
  type counter_array is array(Natural range <>) of Natural;

begin

  process(clk) is
    variable counters : counter_array(NOuts-1 downto 0) := (others => 0);
    variable current_signals : unsigned(NOuts-1 downto 0) := (others => '1');
  begin

    if clk'event and clk = '1' then

      for I in counters'Right to counters'Left loop

        counters(I) := (counters(I) + 1) mod 2**(I+1);

      end loop;

     
    end if;

    for I in counters'Right to counters'Left loop

      if counters(I) = 0 then
        current_signals(I) := not current_signals(I);
      end if;

    end loop;

    output <= current_signals;
    

  end process;
  
end Behavioral;

  
    
