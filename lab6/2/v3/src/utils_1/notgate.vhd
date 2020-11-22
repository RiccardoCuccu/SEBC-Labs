LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.constants.ALL;

ENTITY notgate_a IS
  PORT  (
          A : in  std_logic;
          Y : out std_logic
        );
END ENTITY;

ARCHITECTURE behavioral OF notgate_a IS
BEGIN
  Y <= NOT A;
END ARCHITECTURE;
