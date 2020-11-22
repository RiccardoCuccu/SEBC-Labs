library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity TBADD is 
end TBADD; 

architecture TEST of TBADD is

  component TOP
    port(
	    clock: 	in std_logic;
    	reset:	in std_logic;
      	A:	    in std_logic_vector(15 downto 0);
    	B:    	in std_logic_vector(15 downto 0);
    	C:    	in std_logic_vector(15 downto 0);
    	D:    	in std_logic_vector(15 downto 0);
    	E:    	in std_logic_vector(15 downto 0);
    	F:    	in std_logic_vector(15 downto 0);
    	SUM:    out std_logic_vector(15 downto 0)
    );
  end component;

  constant Period: time := 1 ns; -- Clock period (1 GHz)
  signal CLK : std_logic :='0';
  signal RESET: std_logic;
  signal A, B, C, D, E, F: std_logic_vector(15 downto 0);
  signal SUM : std_logic_vector(15 downto 0);

begin

  TOP_TEST: TOP
    port map (CLK, RESET, A, B, C, D, E, F, SUM);

-- Create the permanent Clock and the Reset pulse
  CLK <= not CLK after Period/2;
  RESET <= '1', '0' after Period;
  
  STIMULUS1: process
  begin
    A <= "0000000000000001";
   	B <= "0000000000000010";
   	C <= "0000000000000011";
   	D <= "0000000000000100";
   	E <= "0000000000000101";
   	F <= "0000000000000110";
    wait for (10 * PERIOD);
    A <= "0000000000000001";
    B <= "0000000000000001";
    C <= "0000000000000001";
    D <= "0000000000000001";
    E <= "0000000000000001";
    F <= "0000000000000001";
    wait for (10 * PERIOD);
  end process STIMULUS1;

end TEST;

