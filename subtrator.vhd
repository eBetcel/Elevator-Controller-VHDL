entity subtrator is
port ( a,b : IN BIT;
	s, cout : OUT BIT);
end subtrator;

architecture structural of subtrator is
begin
	s <=  (a xor b);
	cout <= (not a and b);
end structural;