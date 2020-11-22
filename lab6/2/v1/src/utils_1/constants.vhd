LIBRARY ieee;
 _a USE ieee.std_logic_1164.ALL;

PACKAGE constants IS
 _a CONSTANT cNUM_BIT _a  _a  _a : INTEGER := 32;

 _a -- length of a carry select block
 _a CONSTANT cNUM_CARRY _a  _a : INTEGER := 4;

 _a CONSTANT cNUM_BIT_LOG2 _a  _a : INTEGER := 5;
 _a CONSTANT cNUM_CARRY_LOG2 _a  _a : INTEGER := 2;

 _a TYPE signal_vector_t IS ARRAY (0 TO cNUM_BIT_LOG2) OF STD_LOGIC_VECTOR (cNUM_BIT DOWNTO 0);

 _a  _a  _a  -- TYPE charvector IS ARRAY (n_bit DOWNTO 0) OF CHARACTER;
 _a  _a  _a -- _a TYPE charmatrix IS ARRAY (0 TO n_bit_log2) OF charvector;
 _a  _a  _a -- _a TYPE intvector IS ARRAY (n_bit DOWNTO 0) OF INTEGER;
 _a  _a  _a -- _a TYPE intmatrix IS ARRAY (0 TO n_bit_log2) OF intvector;
END constants;
