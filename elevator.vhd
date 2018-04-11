ENTITY elevator IS
PORT ( a: IN bit_vector(8 downto 0);
	andaratual: IN bit_vector(3 downto 0);
	s: OUT bit_vector (6 downto 0);
	s2: out bit_vector (6 downto 0));
END elevator;

ARCHITECTURE structural OF elevator IS


COMPONENT  coder IS
	PORT (
		a, b, c, d, e, f, g, h, i, j: IN BIT;
		s0, s1, s2, s3: OUT BIT --bit menos significativo é o s3
	);
END COMPONENT;

COMPONENT Comparador4bits IS
port (a,b : in bit_vector(3 downto 0);
	s: out bit_vector (2 downto 0));

END COMPONENT;

component display_7seg IS
	PORT (
		a, b, c, d: IN BIT; -- Bit menos significativo é o d
		s0, s1, s2, s3, s4, s5, s6: OUT BIT
	);
END component;

component TROCADOR IS 
PORT(	a: in bit_vector(3 downto 0);
	b: in bit_vector(3 downto 0);
	sel: in bit;
	s0: out bit_vector(3 downto 0);
	s1: out bit_vector(3 downto 0));
end component;



component subtrator4bits is
port (a,b : in bit_vector(3 downto 0);
	s : out bit_vector (3 downto 0));
end component;


--Sinais input - coder // coder - display // display to output
SIGNAL ic: bit_vector (8 downto 0), cd: bit_vector (6 downto 0), do: bit_vector (6 downto 0); 
--Signal coder - destino // entrada - andar atual // comparador - subtrator
SIGNAL cdes: bit_vector (3 downto 0), ea: bit_vector (3 downto 0),
eaSUB : bit_vector (3 downto 0) , ebSUB : bit_vector (3 downto 0), sCOMP : bit ; -- Mesmas entradas usadas no comparador, e a saida do comparador para a comparaçao de < 

SIGNAL s0TROCADOR : bit_vector (3 downto 0) , s1TROCADOR : bit_vector(3 downto 0);

SIGNAL sSUB : bit_vector (3 downto 0); -- saida subtrator que será mostrada no display de 7 segmentos


BEGIN 

