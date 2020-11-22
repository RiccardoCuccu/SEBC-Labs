library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity t0encdec is
port (	ck : in std_logic;
    		rst : in std_logic;
    		A : in std_logic_vector(7 downto 0);
    		B : buffer std_logic_vector(8 downto 0);
    		C : buffer std_logic_vector(7 downto 0));
end t0encdec;

architecture behavioral of t0encdec is

signal A_cod, A_notcod, C_inc, mux : std_logic_vector(7 downto 0);
signal inc, comp : std_logic;

begin
	
	enc: process(ck,rst)
	begin
	  if rst='1' then
	    A_cod <= (others => '0');
      A_notcod <= (others => '0');
	    inc <= '0';
	  elsif ck'event and ck='1' then
      A_notcod <= A;
      inc <= comp;
	    if comp = '0' then
        A_cod <= A;
	    end if;
	  end if;
	end process;
	
	comp <= '1' when A = (A_notcod + 1) else '0';
	B <= inc & A_cod;
	
	dec: process(ck,rst)
	begin
	  if rst='1' then
	    C <= (others => '0');
      --C_cod <= (others => '0');
	  elsif ck'event and ck='1' then
      C <= mux;
      --if B(8) = '1' then
		--	  C_cod <= C_inc;
	    --else 
		--	  C_cod <=  B(7 downto 0);
	    --end if;
	  end if;
	end process;
	
  --C_inc <= C_cod + 1;
  C_inc <= C + 1;
  mux <= B(7 downto 0) when B(8) = '0' else C_inc;
	
end behavioral;