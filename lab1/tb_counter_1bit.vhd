library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; -- we need a conversion to unsigned 

entity TESTCOUNT is 
end TESTCOUNT; 

architecture TEST of TESTCOUNT is

  component COUNT
        generic ( DCOUNT : Time := 0 ns);
	Port (	A:      In	std_logic;
          CK:     In  std_logic;
          RESET:  In  std_logic;
          S:      Out	std_logic;
          Co:     Out	std_logic;
          sum:    Out std_logic);
  end component;
  
  constant Period: time := 2 ns; -- Clock period
  -- constant Period: time := 0.8 ns; -- Clock period
  signal CLK : std_logic :='0';
  signal RESET : std_logic;
  signal COUNTEN : std_logic;
  signal S : std_logic;
  signal Co : std_logic;
  signal sum : std_logic;

begin

  UCOUNTER1: COUNT 
  port map (COUNTEN, CLK, RESET, S, Co, sum);
  
  COUNTEN <= '0', '1' after Period*3, '0' after Period*6;

-- Create the permanent Clock and the Reset pulse
  CLK <= not CLK after Period/2;
  RESET <= '1', '0' after Period;

end TEST;