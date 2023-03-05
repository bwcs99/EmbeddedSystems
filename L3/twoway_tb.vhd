library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity twoway_tb is
end twoway_tb;

architecture behaviour of twoway_tb is

  component twoway
    port(
      clk : in std_logic;
      q   : out std_logic_vector(7 downto 0) := ( others => '0' )
      );
  end component;

  signal clk : std_logic := '0';
  signal   q : std_logic_vector(7 downto 0);

  constant clk_period : time := 20 ns;

begin

  uut : twoway port map(
    clk => clk,
    q => q
    );

  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

  stim_process : process
    variable my_line : line;
  begin

         
    wait for 5120 ns;

    write(my_line, to_integer(unsigned(q)));
    writeline(output, my_line);

    wait for 5100 ns;

    write(my_line, to_integer(unsigned(q)));
    writeline(output, my_line);    

    wait;
    
  end process;

end;

  
   
      
  
