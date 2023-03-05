--Blazej Wrobel, zadanie 5, 250070, 3. rok, w11
-- w tym programie skladam z bramek (dzialajacych na wektorach) wiekszy uklad
-- realizujacy konkretna funkcje logiczna
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity zadanie5 is
  generic(width : integer := 3);
  port(

    a : in std_logic_vector(width-1 downto 0);
    b : in std_logic_vector(width-1 downto 0);
    c : in std_logic_vector(width-1 downto 0);
    d : in std_logic_vector(width-1 downto 0);

    x : out std_logic_vector(width-1 downto 0)

    );

end zadanie5;

architecture Synt of zadanie5 is

  component VGateOr is
    generic(width : integer := 3);
    port(
      X : in std_logic_vector(width-1 downto 0);
      Y : in std_logic_vector(width-1 downto 0);
      Z : out std_logic_vector(width-1 downto 0)
      );
  end component;

  component VGateAnd is
    generic(width : integer := 3);
    port(
      X : in std_logic_vector(width-1 downto 0);
      Y : in std_logic_vector(width-1 downto 0);
      Z : out std_logic_vector(width-1 downto 0)
      );
   end component;

  component VGateNot is
    generic(width : integer := 3);
    port(
      X : in std_logic_vector(width-1 downto 0);
      Y : out std_logic_vector(width-1 downto 0)
       );
  end component;

  signal F_OUT, NEG_F_OUT, S_OUT : std_logic_vector(width-1 downto 0);
      
begin

  G1 : VGateAnd generic map(width => 3)  port map (a, b, F_OUT);
  G2 : VGateOr generic map (width => 3) port map (c, d, S_OUT);
  G3 : VGateNot generic map (width => 3) port map (F_OUT, NEG_F_OUT);
  G4 : VGateOr  generic map (width => 3) port map (S_OUT, NEG_F_OUT, x);

end Synt;

  
                            
  
