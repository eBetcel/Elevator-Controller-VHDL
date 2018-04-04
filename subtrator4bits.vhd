entity subtrator4bits is
port (a,b : in bit_vector(3 downto 0);
	s : out bit_vector (3 downto 0));
end subtrator4bits;

architecture structural of subtrator4bits is

component subtrator_completo is
port ( a,b,cin : IN BIT;
	s,cout : OUT BIT);
end component;


component subtrator is
port ( a,b : IN BIT;
	s,cout : OUT BIT);
end component;

signal c: bit_vector(3 downto 0);

begin 

i0: subtrator port map (a(0),b(0),s(0),c(0));
i1: subtrator_completo port map (a(1),b(1),c(0),s(1),c(1));
i2: subtrator_completo port map (a(2),b(2),c(1),s(2),c(2));
i3: subtrator_completo port map (a(3),b(3),c(2),s(3),c(3));

end structural;
