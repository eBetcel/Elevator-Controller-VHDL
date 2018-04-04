ENTITY display_7seg IS
	PORT (
		a, b, c, d: IN BIT;
		s0, s1, s2, s3, s4, s5, s6: OUT BIT
	);
END display_7seg;

ARCHITECTURE structural OF display_7seg IS
	BEGIN
		s0 <= c OR a  OR (NOT b AND NOT d) OR (b AND d);
		s1 <= NOT b OR (NOT c AND NOT d) OR (c AND d);
		s2 <= NOT c OR d OR b;
		s3 <= a OR (NOT b AND NOT d) OR (NOT b AND c) OR (c AND NOT d) OR (b AND NOT c AND d);
		s4 <= (NOT b AND NOT d) OR (c AND NOT d);
		s5 <= a OR (NOT c AND NOT d) OR (b AND NOT c) OR (b AND NOT d);
		s6 <= a OR (NOT b AND c) OR (c AND NOT d) OR (b AND NOT c);

	END structural;



