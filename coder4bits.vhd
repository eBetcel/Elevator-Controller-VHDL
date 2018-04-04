ENTITY coder IS
	PORT (
		a, b, c, d, e, f, g, h, i, j: IN BIT;
		s0, s1, s2, s3: OUT BIT
	);
END coder;

ARCHITECTURE structural OF coder IS
	BEGIN 
	s0 <= b OR d OR f OR h OR j;
	s1 <= c OR d OR g OR h;
	s2 <= e OR f OR g OR h;
	s3 <= i OR j;

	END structural;
