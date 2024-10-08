LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY pg_network_block_b IS
  PORT  (
          A  : in  std_logic;
          B  : in  std_logic;
          PG : out std_logic;
          G  : out std_logic
        );
END ENTITY pg_network_block_b;

ARCHITECTURE behavioral OF pg_network_block_b IS
BEGIN  -- ARCHITECTURE behavioral
  G  <= A AND B;
  PG <= A XOR B;
END ARCHITECTURE behavioral;