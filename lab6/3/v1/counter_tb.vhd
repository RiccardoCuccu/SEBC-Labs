library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  use ieee.math_real.all ; -- for UNIFORM, TRUNC
  --use work.constants.all;

entity counter_tb is
end entity ; -- counter_tb

architecture arch of counter_tb is

  component counter_ref is 
    --generic (
    --          N_BIT : integer
    --        );
    port    ( 
              CLK       : in  std_logic;
              RST       : in  std_logic;
              COUNT     : in  std_logic;
              DATA_OUT  : out unsigned (8-1 downto 0);
              UP_DN     : out std_logic
          );
  end component counter_ref;

  component counter is 
    --generic (
    --          N_BIT : integer
    --        );
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
  --generic map (
  --              N_BIT => 32
  --            )
  port map    (
                CLK       => CLK_TB, 
                RST       => RST_TB, 
                COUNT     => COUNT_TB, 
                DATA_OUT  => DATA_OUT_TB_REF, 
                UP_DN     => UP_DN_TB_REF
              );

  DUT_BUG : counter 
  --generic map (
  --              N_BIT => 32
  --            )
  port map    (
                CLK       => CLK_TB, 
                RST       => RST_TB, 
                COUNT     => COUNT_TB, 
                DATA_OUT  => DATA_OUT_TB_BUG, 
                UP_DN     => UP_DN_TB_BUG
              );

  CLK_TB <= not CLK_TB after Period/2;
  RST_TB <= '1', '0' after Period;

random: process
  variable seed1, seed2: positive;

  variable rand_count: real;

  variable int_rand_count: integer;

begin
  COUNT_TB   <= '0';

  wait for 5 ns;

    for I in 1 to 1000 loop
    -- Random number generation
    UNIFORM(seed1, seed2, rand_count);

    int_rand_count := INTEGER(rand_count);

    COUNT_TB <= to_std_logic(int_rand_count);

    -- Assert
    assert (DATA_OUT_TB_BUG = DATA_OUT_TB_REF) report "There is a bug in DATA_OUT." severity warning;
    assert (UP_DN_TB_BUG = UP_DN_TB_REF) report "There is a bug in UP_DN." severity warning;
    wait for 1 ns;
  end loop;

  wait;

end process;

end architecture ; -- arch