library ieee; 
use ieee.std_logic_1164.all; 

entity COUNT is 
	generic (DCOUNT : 	Time := 0 ns);
	Port (	A:	   In	std_logic;
          CK:    In  std_logic;
          RESET: In std_logic;
          S:	Out	std_logic ;
          Co:	Out	std_logic;
          sum: Out std_logic);
end COUNT; 

architecture STRUCTURAL of COUNT is

  signal STMP : std_logic;
  -- signal CTMP : std_logic;
  signal STMPSYNC : std_logic;

  component HA 
  generic (DHA : 	Time := 0 ns);
  Port (  A:	In	std_logic;
          B:	In	std_logic;
          S:	Out	std_logic;
          Co:	Out	std_logic);
  end component; 

  component FD
  Port (  D:      In      std_logic;
          CK:     In      std_logic;
          RESET:  In      std_logic;
          Q:      Out     std_logic);
  end component;

begin

  S <= STMPSYNC;
  sum <= STMP;
  -- Co <= CTMP;
  -- CTMP(0) <= A; 

  HADDER: HA
  Port Map (STMPSYNC, A, STMP, Co); 
  
  DFF: FD
  Port Map (STMP, CK, RESET, STMPSYNC); 

end STRUCTURAL;