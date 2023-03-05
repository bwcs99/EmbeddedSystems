-- Blazej Wrobel, zadanie 5, 250070, 3. rok, w11, definicje bramek dzialajacych
-- na wektorach bitow 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity VGateOr is
  generic(width : integer := 3);
  port(
    X : in std_logic_vector(width-1 downto 0);
    Y : in std_logic_vector(width-1 downto 0);
    Z : out std_logic_vector(width-1 downto 0)
    );

end VGateOr;

architecture Behaviour of VGateOr is
begin
   Z <= X or Y after 1 ns;
end Behaviour;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;

entity VGateAnd is
  generic(width : integer := 3);
  port(
    X : in std_logic_vector(width-1 downto 0);
    Y : in std_logic_vector(width-1 downto 0);
    Z : out std_logic_vector(width-1 downto 0)
    );

end VGateAnd;

architecture Behaviour of VGateAnd is
begin
  
  Z <= X and Y after 1 ns;

end Behaviour;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity VGateNot is
  generic(width : integer := 3);
  port(
    X : in std_logic_vector(width-1 downto 0);
    Y : out std_logic_vector(width-1 downto 0)
    );

end VGateNot;

architecture Behaviour of VGateNot is
begin
   Y <= not X after 1 ns;

end Behaviour;



  
    
