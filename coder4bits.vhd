ENTITY coder IS
	PORT (
		a, b, c, d, e, f, g, h, i, j: IN BIT;
		s0, s1, s2, s3: OUT BIT --bit menos significativo é o s3
	);
END coder;

ARCHITECTURE structural OF coder IS
	BEGIN 
	s3 <= b OR d OR f OR h OR j;
	s2 <= c OR d OR g OR h;
	s1 <= e OR f OR g OR h;
	s0 <= i OR j;

	END structural;
