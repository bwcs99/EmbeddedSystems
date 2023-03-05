--  Hello world program
use std.textio.all; -- Imports the standard textio package.

--  Defines a design entity, without any ports.
entity hello is
end hello;

architecture behaviour of hello is
begin
  process
    variable l : line;
    -- deklaruje dodatkowa zmienna typu line
    variable i : line;
  begin
    write (l, String'("Hello world!"));
    writeline (output, l);
    -- uzywam funkcji readline i za pomoca niej czytam z STDIN
    readline(input, i);
    writeline(output, i);
    wait;
  end process;
end behaviour;

