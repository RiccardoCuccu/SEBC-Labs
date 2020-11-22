LIBRARY ieee;
 _b USE ieee.std_logic_1164.ALL;

PACKAGE constants IS
 _b CONSTANT cNUM_BIT _b  _b  _b : INTEGER := 32;

 _b -- length of a carry select block
 _b CONSTANT cNUM_CARRY _b  _b : INTEGER := 4;

 _b CONSTANT cNUM_BIT_LOG2 _b  _b : INTEGER := 5;
 _b CONSTANT cNUM_CARRY_LOG2 _b  _b : INTEGER := 2;

 _b TYPE signal_vector_t IS ARRAY (0 TO cNUM_BIT_LOG2) OF STD_LOGIC_VECTOR (cNUM_BIT DOWNTO 0);

 _b  _b  _b  -- TYPE charvector IS ARRAY (n_bit DOWNTO 0) OF CHARACTER;
 _b  _b  _b -- _b TYPE charmatrix IS ARRAY (0 TO n_bit_log2) OF charvector;
 _b  _b  _b -- _b TYPE intvector IS ARRAY (n_bit DOWNTO 0) OF INTEGER;
 _b  _b  _b -- _b TYPE intmatrix IS ARRAY (0 TO n_bit_log2) OF intvector;
END constants;
