library ieee;
use ieee.std_logic_1164.all;

ENTITY comb_encoder IS
	PORT(	input : IN std_logic_vector(0 TO 10);  -- 11 input bits 
			output : OUT std_logic_vector(0 TO 14)); -- 15 output bits
END comb_encoder;

ARCHITECTURE struct OF comb_encoder IS

BEGIN

--generate check bits
 p0 <= input(0) XOR input(1) XOR input(2) XOR input(6) XOR input(7) XOR input(8) XOR input(10); --m1, m2, m3, m7, m8, m9, m11
 p1 <= input(0) XOR input(3) XOR input(4) XOR input(6) XOR input(7) XOR input(9) XOR input(10); --m1, m4, m5, m7, m8, m10, m11
 p2 <= input(1) XOR input(3) XOR input(5) XOR input(6) XOR input(8) XOR input(9) XOR input(10); --m2, m4, m6, m7, m9, m10, m11
 p3 <= input(2) XOR input(4) XOR input(5) XOR input(7) XOR input(8) XOR input(9) XOR input(10); --m3, m5, m6, m8, m9, m10, m11

--connect up outputs
output(0 TO 10) <= input(0 TO 10);
output(11 TO 14) <= (p0, p1, p2, p3);

END struct;