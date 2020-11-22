library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  use ieee.math_real.all ; -- for UNIFORM, TRUNC
  use work.constants.all;

entity p4_tb is
end entity ; -- p4_tb

architecture arch of p4_tb is

  component p4_adder_ref is 
    generic (
              N_BIT : integer;
              CARRY   : integer
            );
    port    ( 
              A     : in  signed (N_BIT-1 downto 0);
              B     : in  signed (N_BIT-1 downto 0);
              C_IN_0: in  std_logic;
              C_OUT : out std_logic;
              SUM   : out signed (N_BIT-1 downto 0)
          );
  end component p4_adder_ref;

  component p4_adder_1_a is 
    generic (
              N_BIT : integer;
              CARRY   : integer
            );
    port    ( 
              A     : in  signed (N_BIT-1 downto 0);
              B     : in  signed (N_BIT-1 downto 0);
              C_IN_0: in  std_logic;
              C_OUT : out std_logic;
              SUM   : out signed (N_BIT-1 downto 0)
          );
  end component p4_adder_1_a;

  signal A_TB       : signed (31 downto 0);
  signal B_TB       : signed (31 downto 0);
  signal C_IN_0_TB  : std_logic;

  signal C_OUT_REF  : std_logic;
  signal C_OUT_BUG  : std_logic;
  signal SUM_REF    : signed (31 downto 0);
  signal SUM_BUG    : signed (31 downto 0);

  constant Period: time := 1 ns; -- Clock period (1 GHz)

  function to_std_logic(i : in integer) return std_logic is
  begin
      if i = 0 then
         return '0';
      end if;
      return '1';
  end function;


begin

  -- Reference architecture
  DUT_REF : p4_adder_ref 
  generic map (
                N_BIT => 32,
                CARRY => 4
              )
  port map    ( 
                A      => A_TB, 
                B      => B_TB,
                C_IN_0 => C_IN_0_TB,
                C_OUT  => C_OUT_REF,
                SUM    => SUM_REF
              );

  DUT_BUG : p4_adder_1_a
  generic map (
                N_BIT => 32,
                CARRY => 4
              )
  port map    (
                A      => A_TB, 
                B      => B_TB,
                C_IN_0 => C_IN_0_TB,
                C_OUT  => C_OUT_BUG,
                SUM    => SUM_BUG
              );

  C_IN_0_TB <= '0', '1' after Period;


random: process
  variable seed1, seed2: positive;

  variable rand_1: real;
  variable rand_2: real;
  variable rand_C: real;

  variable int_rand_1: integer;
  variable int_rand_2: integer;
  variable int_rand_C: integer;

begin
  --INCA_TB   <= '0';
  --INCB_TB   <= '0';
  --EXTA_TB   <= '0';
  --EXTB_TB   <= '0';
  A_TB    <= to_signed(0, A_TB'LENGTH);
  B_TB    <= to_signed(0, B_TB'LENGTH);
  --C_IN_0_TB   <= '0';
  wait for 5 ns;

  for I in 1 to 100000 loop
    -- Random number generation
    UNIFORM(seed1, seed2, rand_1);
    UNIFORM(seed1, seed2, rand_2);
    --UNIFORM(seed1, seed2, rand_C);

    int_rand_1 := INTEGER(TRUNC(rand_1*4294967296.0 - 2147483649.0));
    int_rand_2 := INTEGER(TRUNC(rand_2*4294967296.0 - 2147483649.0));
    --int_rand_C := INTEGER(rand_C);

    A_TB      <= to_signed(int_rand_1, A_TB'LENGTH);
    B_TB      <= to_signed(int_rand_2, B_TB'LENGTH);
    --C_IN_0_TB <= to_std_logic(int_rand_C);

    -- Assert
    assert (SUM_BUG = SUM_REF) report "There is a bug in the sum." severity warning;
    assert (C_OUT_BUG = C_OUT_REF) report "There is a bug in the c_out." severity warning;
    wait for 1 ns;
  end loop;

  wait;

end process;

end architecture ; -- arch