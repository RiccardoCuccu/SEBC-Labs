library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic
use IEEE.std_logic_signed.all; 

entity top is
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
end	top;

---------------------------------------------

architecture structural of TOP is

  	signal sum_signal: std_logic_vector(15 downto 0);
	signal sum0: std_logic_vector(15 downto 0);
	signal sum1: std_logic_vector(15 downto 0);
  
  signal sel00: std_logic;
  signal sel01: std_logic;
  signal sel10: std_logic;
  signal sel11: std_logic;

  component FSM_ADDER
  port(
	clock: 	in std_logic;
  	reset:	in std_logic;
  	SEL00:	out std_logic;
  	SEL01:	out std_logic;
	SEL10:	out std_logic;
  	SEL11:	out std_logic
  );
  end component; 

  component datapath_adder
  port(
  	MUX00:	in std_logic_vector(15 downto 0);
	MUX01:	in std_logic_vector(15 downto 0);
  	MUX02:	in std_logic_vector(15 downto 0);
  	MUX03:	in std_logic_vector(15 downto 0);
  	MUX10:	in std_logic_vector(15 downto 0);
  	MUX11:	in std_logic_vector(15 downto 0);
  	MUX12:	in std_logic_vector(15 downto 0);
  	MUX13:	in std_logic_vector(15 downto 0);
  	clock: 	in std_logic;
  	reset:	in std_logic;
  	SEL00:	in std_logic;
  	SEL01:	in std_logic;
  	SEL10:	in std_logic;
	SEL11:	in std_logic;
  	SUM:	out std_logic_vector(15 downto 0)
   );
  end component; 
  
begin
  sum0 <= sum_signal;
  sum1 <= sum_signal;
  SUM <= sum_signal;

  DATAPATH: datapath_adder
  port map (
    A,
    C,
    D,
    sum0,
    B,
    sum1,
    E,
    F,
    clock,
  	reset,
  	sel00,
  	sel01,
  	sel10,
	sel11,
  	sum_signal
  );
  
  FSM: FSM_ADDER
  port map(
	  clock,
  	reset,
  	sel00,
  	sel01,
	  sel10,
  	sel11
  );
  
end structural;

--configuration CFG_TOP_STRUCTURAL of top is
--  for structural 
--    for FSM_ADDER
--      use configuration CFG_FSM_ADDER;
--    end for;
--    for DATAPATH_ADDER
--      use configuration CFG_DP_ADDER;
--    end for;
--  end for;
--end CFG_TOP_STRUCTURAL; 
