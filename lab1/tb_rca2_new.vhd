library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; -- we need a conversion to unsigned 

entity TBRCA is 
end TBRCA; 

architecture TEST of TBRCA is


  component RCA
        generic ( DRCAS : Time := 0 ns;
	          DRCAC : Time := 0 ns);
	Port (	A:	In	std_logic_vector(7 downto 0);
		B:	In	std_logic_vector(7 downto 0);
		Ci:	In	std_logic;
		S:	Out	std_logic_vector(7 downto 0);
		Co:	Out	std_logic);
  end component;
  

  signal DIN : std_logic_vector(15 downto 0);

  signal A, B, S1, S2 : std_logic_vector(7 downto 0);
  signal Ci, Co1, Co2 : std_logic;

Begin

-- Instanciate the ADDER without delay
  --UADDER1: RCA generic map (DRCAS => 0.025 ns, DRCAC => 0 ns) port map (A, B, Ci, S1, Co1);
  
-- Instanciate the ADDER without delay
  UADDER2: RCA generic map (DRCAS => 0.025 ns, DRCAC => 0.025 ns) port map (A, B, Ci, S2, Co2);
  
  Ci <= '0';
  A <=	DIN(7 downto 0);
  B <=	DIN(15 downto 8);
  DIN <= "1010101010101010", "1111111100000001" after 1 ns;
end TEST;

