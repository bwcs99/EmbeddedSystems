-- Blazej Wrobel, 250070, w11, informatyka
library std;
library ieee;
use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_tb is
end shift_register_tb;

architecture behaviour of shift_register_tb is

        -- uut
	component shift_register 
		 port (
	      clk : in std_logic;
	      q : inout std_logic_vector(15 downto 0) := ( others => '0')
	      );
  	end component;
  	-- sygnal zegara
  	signal clk : std_logic := '0';
        -- rejestr
  	signal q : std_logic_vector(15 downto 0);

        -- tablice na bajty (odpowiednio bajt wyzszy i nizszy)
  	signal u_byte : std_logic_vector(7 downto 0);
  	signal l_byte : std_logic_vector(7 downto 0);

        -- sygnal zegara
  	signal clk_period : time := 20 ns;
begin
	uut : shift_register port map(
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

                -- kopiujemy bajty
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
