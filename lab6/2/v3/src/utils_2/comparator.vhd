library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator_b is
  generic ( 
            N : integer 
          );
  port    (
            A     : in  signed ( N - 1 downto 0);
            B     : in  signed ( N - 1 downto 0);
            C     : out signed ( N - 1 downto 0)
          );
end comparator_b;

architecture arch of comparator_b is

begin
  comp : process( A, B )
  begin
    if ( A > B ) then 
      C <= A;
    else
      C <= B;
    end if;
  end process;
end architecture ; -- arch
