library ieee;
use ieee.std_logic_1164.all;

entity comb_decoder is
	Port(	input : in std_logic_vector ( 0 to 14 );-- 15 encoded bits as input
			output: out std_logic_vector ( 0 to 10 );-- 11 decoded bits as output
			error :	out std_logic -- 'boolean' flag to indicate if there was error(s) detected
			); 
end comb_decoder;

architecture Struct of comb_decoder is

	signal pc0, pc1, pc2, pc3 : std_logic; -- parity check bits	
	signal coded : std_logic_vector ( 0 to 10 );
	signal decoded_out : std_logic_vector ( 0 to 10 );

begin
	
	coded <= input(0 to 10);
	
	--generate check bits
	pc0 <= input(0) XOR input(1) XOR input(2) XOR input(6) XOR input(7) XOR input(8) XOR input(10) XOR input(11); --m1, m2, m3, m7, m8, m9, m11, p0
	pc1 <= input(0) XOR input(3) XOR input(4) XOR input(6) XOR input(7) XOR input(9) XOR input(10) XOR input(12); --m1, m4, m5, m7, m8, m10, m11, p1
	pc2 <= input(1) XOR input(3) XOR input(5) XOR input(6) XOR input(8) XOR input(9) XOR input(10) XOR input(13); --m2, m4, m6, m7, m9, m10, m11, p2
	pc3 <= input(2) XOR input(4) XOR input(5) XOR input(7) XOR input(8) XOR input(9) XOR input(10) XOR input(14); --m3, m5, m6, m8, m9, m10, m11, p3

	
	-- error correction
	-- use parity bits as an address of wrong bit?
	
	--connect up outputs
	output <= input(0 to 10); -- doesnt take into account bit correction (todo)
	error <= pc0 OR pc1 OR pc2 OR pc3;
	

end Struct;