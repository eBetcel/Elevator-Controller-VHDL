entity subtrator_completo is
port ( a,b,cin : IN BIT;
	s,cout : OUT BIT);
end subtrator_completo;

architecture structural of subtrator_completo is
begin
	s <=  (a xor b) xor cin;
	cout <= (not a and b) or ( not a and cin) or (b and cin);
end structural;