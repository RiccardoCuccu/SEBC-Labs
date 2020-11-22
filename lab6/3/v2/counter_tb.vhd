library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  use ieee.math_real.all ; -- for UNIFORM, TRUNC

entity counter_tb is
end entity ; -- counter_tb

architecture arch of counter_tb is

  component counter_ref is 
    port    ( 
              CLK       : in  std_logic;
              RST       : in  std_logic;
              COUNT     : in  std_logic;
              DATA_OUT  : out unsigned (8-1 downto 0);
              UP_DN     : out std_logic
          );
  end component counter_ref;

  component counter is 
    port    ( 
              CLK       : in  std_logic;
              RST       : in  std_logic;
              COUNT     : in  std_logic;
              DATA_OUT  : out unsigned (8-1 downto 0);
              UP_DN     : out std_logic
          );
  end component counter;

  constant Period: time := 1 ns; -- CloCLK period (1 GHz)
  signal CLK_TB    : std_logic :='0';
  signal RST_TB   : std_logic;
  signal COUNT_TB : std_logic;

  signal DATA_OUT_TB_REF : unsigned (8-1 downto 0);
  signal DATA_OUT_TB_BUG : unsigned (8-1 downto 0);

  signal UP_DN_TB_REF : std_logic;
  signal UP_DN_TB_BUG : std_logic;

  function to_std_logic(i : in integer) return std_logic is
  begin
      if i = 0 then
         return '0';
      end if;
      return '1';
  end function;


begin

  -- Reference architecture
  DUT_REF : counter_ref 
  port map    (
                CLK       => CLK_TB, 
                RST       => RST_TB, 
                COUNT     => COUNT_TB, 
                DATA_OUT  => DATA_OUT_TB_REF, 
                UP_DN     => UP_DN_TB_REF
              );

  DUT_BUG : counter 
  port map    (
                CLK       => CLK_TB, 
                RST       => RST_TB, 
                COUNT     => COUNT_TB, 
                DATA_OUT  => DATA_OUT_TB_BUG, 
                UP_DN     => UP_DN_TB_BUG
              );

  CLK_TB <= not CLK_TB after Period/2;
  --RST_TB <= '1', '0' after Period;

  -- Assert
  assert (DATA_OUT_TB_BUG = DATA_OUT_TB_REF) report "There is a bug in DATA_OUT." severity warning;
  assert (UP_DN_TB_BUG = UP_DN_TB_REF) report "There is a bug in UP_DN." severity warning;

timer_gen: process
  variable t : natural range 0 to 100 := 0;

begin
  COUNT_TB  <= '0';
  RST_TB    <= '1';

  wait for 1 ns;

  RST_TB <= '0';
  COUNT_TB  <= '1';

  wait until DATA_OUT_TB_BUG = 1;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until DATA_OUT_TB_BUG = 2;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until DATA_OUT_TB_BUG = 3;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until DATA_OUT_TB_BUG = 4;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until DATA_OUT_TB_BUG = 5;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until DATA_OUT_TB_BUG = 6;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until DATA_OUT_TB_BUG = 7;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until UP_DN_TB_BUG = '0';
  wait until DATA_OUT_TB_BUG = 1;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until UP_DN_TB_BUG = '0';
  wait until DATA_OUT_TB_BUG = 2;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until UP_DN_TB_BUG = '0';
  wait until DATA_OUT_TB_BUG = 3;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until UP_DN_TB_BUG = '0';
  wait until DATA_OUT_TB_BUG = 4;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until UP_DN_TB_BUG = '0';
  wait until DATA_OUT_TB_BUG = 5;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until UP_DN_TB_BUG = '0';
  wait until DATA_OUT_TB_BUG = 6;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait until UP_DN_TB_BUG = '0';
  wait until DATA_OUT_TB_BUG = 7;
  RST_TB <= '1';
  wait for 1 ns;
  RST_TB <= '0';

  wait;

end process;

end architecture ; -- arch