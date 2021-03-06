ENTITY display_7seg IS
	PORT (
		a: IN BIT_VECTOR ( 3 downto 0 ); -- Bit menos significativo é o d
		s: OUT BIT_VECTOR ( 6 downto 0)
	);
END display_7seg;

ARCHITECTURE structural OF display_7seg IS

	BEGIN
--		s0 <= c OR a  OR (NOT b AND NOT d) OR (b AND d);
--		s1 <= NOT b OR (NOT c AND NOT d) OR (c AND d);
--		s2 <= NOT c OR d OR b;
--		s3 <= a OR (NOT b AND NOT d) OR (NOT b AND c) OR (c AND NOT d) OR (b AND NOT c AND d);
--		s4 <= (NOT b AND NOT d) OR (c AND NOT d);
--		s5 <= a OR (NOT c AND NOT d) OR (b AND NOT c) OR (b AND NOT d);
--		s6 <= a OR (NOT b AND c) OR (c AND NOT d) OR (b AND NOT c);

		s(0) <= a(2) or a(0) or (not a(1) and not a(3)) or (a(1) and a(3));
		s(1) <= not a(1) or (not a(2) and not a(3)) or (a(2) and a(3));
		s(2) <= not a(2) or a(3) or a(1);
		s(3) <= a(0) or (not a(1) and not a(3)) or (not a(1) and a(2)) or (a(2) and not a(3)) or (a(1) and not a(2) and a(3));
		s(4) <= (not a(1) and not a(3)) or (a(2) and not a(3));
		s(5) <= a(0) or (not a(2) and not a(3)) or (a(1) and not a(2)) or (a(1) and not a(3));
		s(6) <= a(0) or (not a(1) and a(2)) or (a(2) and not a(3)) or (a(1) and not a(2));

END structural;



