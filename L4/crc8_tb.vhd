LIBRARY ieee;
library std;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use std.textio.all;

ENTITY crc8_tb IS
END crc8_tb;
 
ARCHITECTURE behavior OF crc8_tb IS 
    -- main component counting CRC sums
    COMPONENT crc8
    PORT(
         clk : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         crc_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 -- component delcaration for ROM look-up 
	 component rom_for_crc8
    Port ( address  : in  STD_LOGIC_VECTOR (2 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0)
			);
	 end component;
    
	-- clock stuff
   signal clk : std_logic := '0';
   -- clock period 
   constant clk_period : time := 20 ns;
	
	-- CRC generator data
	-- input
   signal data_in : std_logic_vector(7 downto 0) := X"a0";
   -- output 
   signal crc_out : std_logic_vector(7 downto 0);

	-- ROM
   -- output data 
	signal data_out_a0 : std_logic_vector(7 downto 0); 
	signal data_out_66 : std_logic_vector(7 downto 0);
	-- po zainicjowaniu wektora na adres nie ma juz ostrzezen
	signal address : std_logic_vector(2 downto 0) := (others => '0');
	-- access address
	-- signal address : std_logic_vector(2 downto 0)
	signal newCRC : std_logic_vector(7 downto 0);

 
BEGIN
 	-- Instantiate the Unit Under Test (UUT)
   uut: crc8 PORT MAP (
          clk => clk,
          data_in => data_in,
          crc_out => crc_out
        );
		  
	 -- instance of ROM lookup for constant X"a0" input
	 rom_a0 : entity work.rom_for_crc8(const_a0)
	 port map (
			 address => address,
			 data_out => data_out_a0
		  );
	 -- instance of ROM lookup for constant X"66" input
	 rom_66 : entity work.rom_for_crc8(const_66) 
	 port map (
	 		 address => address,
			 data_out => data_out_66
		  );

   -- Clock process definitions
   clk_process :process
	  variable wait_done : natural := 0;
   begin
	   if wait_done = 0
		then
		   wait for clk_period * 0.2;
			wait_done := 1;
	   end if;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		
   end process;
 

   -- Stimulus process
   stim_proc: process
   	variable a : integer := 0;
   	variable b : integer := 0;
   	variable l : line;
   	
   begin
   
   for I in 0 to 7 loop		
      
     wait for 3 ns;
     
     a := to_integer(unsigned(data_out_a0));
     
     wait for 15 ns;
     
     b := to_integer(unsigned(crc_out));
          
     assert a = b report "zle - wartosci nie sa rowne" severity error;
     
     assert a /= b report "dobrze ! - wartosci zgadzaja sie" severity note;
     
     address <= std_logic_vector(unsigned(address) + 1);
     
     wait for 2 ns;
   end loop;
   
   data_in <= X"18";
   
   wait for 24 ns;
   
   data_in <= X"66";
   address <= (others => '0');
   
   for J in 0 to 7 loop
   
     wait for 3 ns;
     
     a := to_integer(unsigned(data_out_66));
     
     wait for 15 ns;
     
     b := to_integer(unsigned(crc_out));
          
     assert a = b report "zle - wartosci nie sa rowne" severity error;
     
     assert a /= b report "dobrze ! - wartosci zgadzaja sie" severity note;
     
     address <= std_logic_vector(unsigned(address) + 1);
     
   end loop;
     wait;
   end process;

END;
