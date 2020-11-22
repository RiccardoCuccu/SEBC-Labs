library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  use ieee.math_real.all ; -- for UNIFORM, TRUNC
  use work.constants.all;

entity inccomp_tb is
end entity ; -- inccomp_tb

architecture arch of inccomp_tb is

  component INCCOMP_REF is 
    generic (
              N_BIT : integer
            );
    port    ( 
              CK    : in  std_logic;
              RST   : in  std_logic;
              INCA  : in  std_logic;
              INCB  : in  std_logic;
              EXTA  : in  std_logic;
              EXTB  : in  std_logic;
              A     : in  signed (N_BIT-1 downto 0);
              B     : in  signed (N_BIT-1 downto 0);
              C     : out signed (N_BIT-1 downto 0)
          );
  end component INCCOMP_REF;

  component INCCOMP is 
    generic (
              N_BIT : integer
            );
    port    ( 
              CK    : in  std_logic;
              RST   : in  std_logic;
              INCA  : in  std_logic;
              INCB  : in  std_logic;
              EXTA  : in  std_logic;
              EXTB  : in  std_logic;
              A     : in  signed (N_BIT-1 downto 0);
              B     : in  signed (N_BIT-1 downto 0);
              C     : out signed (N_BIT-1 downto 0)
          );
  end component INCCOMP;

  constant Period: time := 1 ns; -- Clock period (1 GHz)
  signal CK_TB    : std_logic :='0';
  signal RST_TB   : std_logic;
  signal INCA_TB  : std_logic;
  signal INCB_TB  : std_logic;
  signal EXTA_TB  : std_logic;
  signal EXTB_TB  : std_logic;
  signal A_TB     : signed (31 downto 0);
  signal B_TB     : signed (31 downto 0);

  signal C_TB_REF     : signed (31 downto 0);
  signal C_TB_BUG     : signed (31 downto 0);

  function to_std_logic(i : in integer) return std_logic is
  begin
      if i = 0 then
         return '0';
      end if;
      return '1';
  end function;


begin

  -- Reference architecture
  DUT_REF : INCCOMP_REF 
  generic map (
                N_BIT => 32
              )
  port map    (
                CK    => CK_TB, 
                RST   => RST_TB, 
                INCA  => INCA_TB, 
                INCB  => INCB_TB, 
                EXTA  => EXTA_TB, 
                EXTB  => EXTB_TB, 
                A     => A_TB, 
                B     => B_TB, 
                C     => C_TB_REF
              );

  DUT_BUG : INCCOMP 
  generic map (
                N_BIT => 32
              )
  port map    (
                CK    => CK_TB, 
                RST   => RST_TB, 
                INCA  => INCA_TB, 
                INCB  => INCB_TB, 
                EXTA  => EXTA_TB, 
                EXTB  => EXTB_TB, 
                A     => A_TB, 
                B     => B_TB, 
                C     => C_TB_BUG
              );

  CK_TB <= not CK_TB after Period/2;
  RST_TB <= '1', '0' after Period;
  EXTA_TB   <= '0', '1' after Period*5, '0' after Period*10, '1' after Period*55, '0' after Period*60;
  EXTB_TB   <= '0', '1' after Period*5, '0' after Period*10, '1' after Period*55, '0' after Period*60;
  assert (C_TB_BUG = C_TB_REF) report "There is a bug." severity warning;

random: process
  variable seed1, seed2: positive;

  variable rand_1: real;
  variable rand_2: real;
  variable rand_A: real;
  variable rand_B: real;

  variable int_rand_1: integer;
  variable int_rand_2: integer;
  variable int_rand_A: integer;
  variable int_rand_B: integer;

  variable sum: signed(31 downto 0);

begin
  INCA_TB   <= '0';
  INCB_TB   <= '0';
  --EXTA_TB   <= '0';
  --EXTB_TB   <= '0';
  A_TB    <= to_signed(0, A_TB'LENGTH);
  B_TB    <= to_signed(0, B_TB'LENGTH);
  wait for 5 ns;


  for I in 1 to 50 loop
    -- Random number generation
    UNIFORM(seed1, seed2, rand_1);
    UNIFORM(seed1, seed2, rand_2);
    UNIFORM(seed1, seed2, rand_A);
    UNIFORM(seed1, seed2, rand_B);

    int_rand_1 := INTEGER(TRUNC(rand_1*4294967296.0 - 2147483649.0));
    int_rand_2 := INTEGER(TRUNC(rand_2*4294967296.0 - 2147483649.0));
    int_rand_A := INTEGER(rand_A);
    int_rand_B := INTEGER(rand_B);

    A_TB    <= to_signed(int_rand_1, A_TB'LENGTH);
    B_TB    <= to_signed(int_rand_2, B_TB'LENGTH);
    INCA_TB <= to_std_logic(int_rand_A);
    INCB_TB <= to_std_logic(int_rand_B);

    -- Assert
    --assert (C_TB_BUG = C_TB_REF) report "There is a bug." severity warning;
    wait for 5 ns;
  end loop;

  wait;

end process;

end architecture ; -- arch