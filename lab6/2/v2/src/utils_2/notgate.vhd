LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.constants.ALL;

ENTITY notgate_b IS
  PORT  (
          A : in  std_logic;
          Y : out std_logic
        );
END ENTITY;

ARCHITECTURE behavioral OF notgate_b IS
BEGIN
  Y <= NOT A;
END ARCHITECTURE;
