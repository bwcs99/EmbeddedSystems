-- Blazej Wrobel, 250070, 3. rok, W11
entity system_tb is
end system_tb;

architecture behav of system_tb is
  component system
    port(a, b, c : in bit ; x, y : out bit);
  end component;

  for system_0: system use entity work.system;
  signal a, b, c, x, y : bit;
begin
  system_0: system port map (a => a, b => b, c => c, x => x, y => y);

  process
    type pattern_type is record
      a, b, c : bit;

      x, y : bit;
    end record;

    type test_array is array (natural range <>) of pattern_type;
    constant tests : test_array :=
      (('0', '0', '0', '0', '0'),
       ('0', '0', '1', '1', '1'),
       ('0', '1', '0', '1', '0'),
       ('0', '1', '1', '1', '1'),
       ('1', '0', '0', '1', '0'),
       ('1', '1', '0', '1', '1'),
       ('1', '0', '1', '1', '0'),
       ('1', '1', '1', '1', '0'));

  begin
    for i in tests'range loop
      a <= tests(i).a;
      b <= tests(i).b;
      c <= tests(i).c;

      wait for 1 ns;

      assert x = tests(i).x
        report "bad x value" severity error;

      assert y = tests(i).y
        report "bad y value" severity error;

    end loop;

    assert false report "end of test. success !" severity note;

    wait;

    end process;

  end behav;
  
  
        
      
           
      
