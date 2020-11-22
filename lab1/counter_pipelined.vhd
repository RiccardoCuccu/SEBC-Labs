library ieee; 
use ieee.std_logic_1164.all; 

entity COUNT is 
	generic (DCOUNT : 	Time := 0 ns);
	Port (	A:	In	std_logic;
	       CK:     In      std_logic;
	       RESET: In      std_logic;
	       S:	Out	std_logic_vector(7 downto 0);
	       Co:	Out	std_logic);
end COUNT; 

architecture STRUCTURAL of COUNT is

	signal STMP : std_logic_vector(7 downto 0);
	signal register7 : std_logic_vector(8 downto 0);
	signal register6 : std_logic_vector(7 downto 0);
	signal register5 : std_logic_vector(6 downto 0);
	signal register4 : std_logic_vector(5 downto 0);
	signal register3 : std_logic_vector(4 downto 0);
	signal register2 : std_logic_vector(3 downto 0);
	signal register1 : std_logic_vector(2 downto 0);
	signal register0 : std_logic_vector(1 downto 0);
	signal CTMP : std_logic_vector(8 downto 0);
	signal CTMPPIPE : std_logic_vector(8 downto 0);
	signal STMPSYNC : std_logic_vector(7 downto 0);
	
	component HA 
	generic (DHA : 	Time := 0 ns);
	Port ( A:	In	std_logic;
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

	STMPSYNC(7) <= register7(0);
	STMPSYNC(6) <= register6(0);
	STMPSYNC(5) <= register5(0);
	STMPSYNC(4) <= register4(0);
	STMPSYNC(3) <= register3(0);
	STMPSYNC(2) <= register2(0);
	STMPSYNC(1) <= register1(0);
	STMPSYNC(0) <= register0(0);
	
	S <= STMPSYNC;
	
	Co <= CTMPPIPE(7);
	
	CTMP(0) <= A; 

	HADDER0: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(0), CTMP(0), register0(1), CTMPPIPE(0)); 
	HADDER1: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(1), CTMP(1), register1(2), CTMPPIPE(1)); 
	HADDER2: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(2), CTMP(2), register2(3), CTMPPIPE(2)); 
	HADDER3: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(3), CTMP(3), register3(4), CTMPPIPE(3)); 
	HADDER4: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(4), CTMP(4), register4(5), CTMPPIPE(4)); 
	HADDER5: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(5), CTMP(5), register5(6), CTMPPIPE(5)); 
	HADDER6: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(6), CTMP(6), register6(7), CTMPPIPE(6)); 
	HADDER7: HA generic map (DHA => DCOUNT) Port Map (STMPSYNC(7), CTMP(7), register7(8), CTMPPIPE(7)); 
	
	DFF1:  for I in 1 to 7 generate
		DFFCI : FD Port Map (CTMPPIPE(I-1), CK, RESET, CTMP(I));
	end generate;

	Pipe0_Gen: for I in 1 downto 1 generate
		Reg0_I: FD Port Map (register0(I), CK, RESET, register0(I-1));
	end generate;

	Pipe1_Gen: for I in 2 downto 1 generate
		Reg1_I: FD Port Map (register1(I), CK, RESET, register1(I-1));
	end generate;

	Pipe2_Gen: for I in 3 downto 1 generate
		Reg2_I: FD Port Map (register2(I), CK, RESET, register2(I-1));
	end generate;

	Pipe3_Gen: for I in 4 downto 1 generate
		Reg3_I: FD Port Map (register3(I), CK, RESET, register3(I-1));
	end generate;

	Pipe4_Gen: for I in 5 downto 1 generate
		Reg4_I: FD Port Map (register4(I), CK, RESET, register4(I-1));
	end generate;

	Pipe5_Gen: for I in 6 downto 1 generate
		Reg5_I: FD Port Map (register5(I), CK, RESET, register5(I-1));
	end generate;

	Pipe6_Gen: for I in 7 downto 1 generate
		Reg6_I: FD Port Map (register6(I), CK, RESET, register6(I-1));
	end generate;

	Pipe7_Gen: for I in 8 downto 1 generate
		Reg7_I: FD Port Map (register7(I), CK, RESET, register7(I-1));
	end generate;

end STRUCTURAL;


configuration CFG_COUNT_STRUCTURAL of COUNT is
  for STRUCTURAL 
--	for HADDER0
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
--	for HADDER1
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
--	for HADDER2
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
--	for HADDER3
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
--	for HADDER4
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
--	for HADDER5
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
--	for HADDER6
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
--	for HADDER7
--		for all : HA
--			use configuration WORK.CFG_HA_BEHAVIORAL;
--		end for;
--	end for;
	for DFF1	
		for all : FD
			use configuration WORK.CFG_FD_PLUTO;
		end for;
	end for;
----    for DFF3
----      for all : FD
----  use configuration WORK.CFG_FD_PLUTO;
----      end for;  
----    end for;
----    for LATCH1
----      for all : LATCH
----  use configuration WORK.CFG_LATCH_PLUTO;
----      end for;  
----    end for;
  end for;
end CFG_COUNT_STRUCTURAL;
