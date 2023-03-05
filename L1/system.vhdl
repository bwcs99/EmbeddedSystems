-- Blazej Wrobel, 250070, W11, 3. rok
entity system is
  port (a, b, c : in bit ; x, y : out bit);
end system;

architecture scheme of system is
begin
  x <= a or b or c;
  y <= (a xor c) and (b or c);
end scheme;
