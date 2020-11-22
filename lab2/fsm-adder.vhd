library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic
use IEEE.std_logic_signed.all; 

entity fsm_adder is
	port(
		clock: 	in std_logic;
		reset:	in std_logic;
		SEL00:	out std_logic;
		SEL01:	out std_logic;
		SEL10:	out std_logic;
		SEL11:	out std_logic
		);
end	fsm_adder;

---------------------------------------------

architecture behavioral of fsm_adder is -- enumerated type state machine encoding

  type states is (S1, S2, S3, S4, S5);
  attribute enum_encoding: string;
  attribute enum_encoding of states: TYPE IS "000 001 011 111 110";
  signal current_state: states;
  signal next_state: states;
  
begin

  P_CURRENT_STATE: process(clock, reset)
  begin
    if reset = '1' then
      current_state <= S1;
    elsif (clock='1' and clock'event) then
      current_state <= next_state;
    end if;
  end process P_CURRENT_STATE;
  
  P_NEXT_STATE: process(current_state)

  begin
    case current_state is
      when S1 => next_state <= S2;
      when S2 => next_state <= S3;
      when S3 => next_state <= S4;
      when S4 => next_state <= S5;
      when S5 => next_state <= S1;
    end case;
  end process P_NEXT_STATE;



  P_OUTPUTS: process(current_state)
  
begin    
    case current_state is
      when S1 => SEL00<='0'; SEL01<='0'; SEL10<='0'; SEL11<='0'; -- A+B=O1
      when S2 => SEL00<='0'; SEL01<='1'; SEL10<='0'; SEL11<='1'; -- O1+C=O2
      when S3 => SEL00<='1'; SEL01<='1'; SEL10<='0'; SEL11<='1'; -- O2+D=O3
      when S4 => SEL00<='1'; SEL01<='0'; SEL10<='1'; SEL11<='1'; -- O3+E=O4
      when S5 => SEL00<='1'; SEL01<='0'; SEL10<='1'; SEL11<='0'; -- O4+F=SUM
    end case;
  end process P_OUTPUTS;
  
end behavioral;

configuration CFG_FSM_ADDER of fsm_adder is
	for  behavioral
	end for;
end CFG_FSM_ADDER;
