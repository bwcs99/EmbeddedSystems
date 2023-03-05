library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity fdivider is
  generic(NBit : Positive := 8 ; Divider : Integer := 1);
  port( clk : in std_logic;
        output : out std_logic := '1'
        );
end fdivider;

architecture Behavioral of fdivider is
begin
    
    
  process(clk) is
     variable counter : unsigned(NBit-1 downto 0) := (others => '0');
     variable current_signal : std_logic := '1';
     constant q : Integer := Divider;
  begin

    if (clk'event and clk = '1') then
      counter := counter + 1;
    end if;

    if to_integer(counter) = q then
      current_signal := not current_signal;
      counter := (others => '0');
    end if;

    output <= current_signal;

  end process;

end Behavioral;



              

    

                        

    
