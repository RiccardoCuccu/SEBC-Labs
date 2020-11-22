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

  -- Architecture under test
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

  assert (C_TB_BUG = C_TB_REF) report "There is a bug." severity warning;

begin
  INCA_TB   <= '0';
  INCB_TB   <= '0';
  EXTA_TB   <= '0';
  EXTB_TB   <= '0';
  A_TB    <= to_signed(0, A_TB'LENGTH);
  B_TB    <= to_signed(0, B_TB'LENGTH);
  wait for 5 ns;

  INCA_TB   <= '1';
  A_TB    <= "00000000000000000000000000000000";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000000000000100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000000000001100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000000000011100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000000000111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000000001111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000000011111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000000111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000001111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000011111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000000111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000001111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000011111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000000111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000001111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000011111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000000111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000001111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000011111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000000111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000001111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000011111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000000111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000001111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000011111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00000111111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00001111111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00011111111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "00111111111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "01111111111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  A_TB    <= "11111111111111111111111111111100";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 20 ns;
  INCA_TB   <= '0';

  A_TB    <= "00000000000000000000000000000000";EXTA_TB   <= '1'; wait for 2 ns; EXTA_TB   <= '0'; wait for 200 ns;

  INCB_TB   <= '1';
  B_TB    <= "00000000000000000000000000000000";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000000000000100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000000000001100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000000000011100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000000000111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000000001111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000000011111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000000111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000001111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000011111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000000111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000001111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000011111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000000111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000001111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000011111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000000111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000001111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000011111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000000111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000001111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000011111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000000111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000001111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000011111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00000111111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00001111111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00011111111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "00111111111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "01111111111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  B_TB    <= "11111111111111111111111111111100";EXTB_TB   <= '1'; wait for 2 ns; EXTB_TB   <= '0'; wait for 20 ns;
  INCB_TB   <= '0';

  wait;

end process;

end architecture ; -- arch