Entity Comparador4bits is
port (a,b : in bit_vector(3 downto 0);
	s: out bit_vector (2 downto 0));

end Comparador4bits;

architecture structural of Comparador4bits is

Component Comparador is
port (a : in BIT;
	b: in BIT;
	s: out bit_vector(2 downto 0));
end Component;

Component ComparadorComInput is
port (a : in bit;
	b: in bit;
	input: in bit_vector(2 downto 0); -- input recebidos por outros comparadores
	s: out bit_vector(2 downto 0));
end Component;

Signal sig_C1,sig_C2,sig_C3,sig_Ch : bit_vector(2 downto 0);

begin

u0: Comparador port map (a(3),b(3),sig_Ch);
u1: ComparadorComInput port map (a(2),b(2),sig_Ch,sig_C1);
u2: ComparadorComInput port map (a(1),b(1),sig_C1,sig_C2);
u3: ComparadorComInput port map (a(0),b(0),sig_C2,sig_C3);
s(0) <= sig_C3(0);
s(1) <= sig_C3(1);
s(2) <= sig_C3(2);

end structural;


