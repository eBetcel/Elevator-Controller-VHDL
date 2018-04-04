entity Comparador is
port (a : in BIT;
	b: in BIT;
	s: out bit_vector(2 downto 0));
end Comparador;

architecture structural of Comparador is
begin
	s(0) <= ((a and b) or (not a and not b)); -- Igualdade
	s(1) <= (a and not b);
	s(2) <= (not a and b);
end structural; 
