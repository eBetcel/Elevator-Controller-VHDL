ENTITY elevator IS
PORT ( a: IN bit_vector(8 downto 0);
	andaratual: IN bit_vector(3 downto 0);
	s: OUT bit_vector (6 downto 0);
	s2: out bit_vector (6 downto 0));
END elevator;

ARCHITECTURE structural OF elevator IS


COMPONENT  coder IS
	PORT (
		a: IN BIT_VECTOR ( 9 downto 0);
		s: OUT BIT_VECTOR ( 3 downto 0 ) --bit menos significativo é o s3
	);
END COMPONENT;

COMPONENT Comparador4bits IS
port (a,b : in bit_vector(3 downto 0);
	s: out bit_vector (2 downto 0));

END COMPONENT;

component display_7seg IS
	PORT (
		a: IN BIT_VECTOR (3 downto 0); -- Bit menos significativo é o d
		s: OUT BIT_VECTOR (6 downto 0)
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
SIGNAL ic: bit_vector (8 downto 0); 
SIGNAL cd: bit_vector (6 downto 0); 
SIGNAL do: bit_vector (6 downto 0); 
--Signal coder - destino // entrada - andar atual // comparador - subtrator
SIGNAL cdes: bit_vector (3 downto 0);
SIGNAL ea: bit_vector (3 downto 0);
SIGNAL eaSUB,ebSUB: bit_vector (3 downto 0);-- Mesmas entradas usadas no comparador, e a saida do comparador para a comparaçao de < 

SIGNAL sCOMP : bit_vector (2 downto 0) ; -- Mesmas entradas usadas no comparador, e a saida do comparador para a comparaçao de < 

SIGNAL s0TROCADOR : bit_vector (3 downto 0); 
SIGNAL s1TROCADOR : bit_vector(3 downto 0);

SIGNAL sSUB : bit_vector (3 downto 0); -- saida subtrator que será mostrada no display de 7 segmentos

SIGNAL sSUB_display: bit_vector (6 downto 0);

BEGIN 

-- u1: coder4bits port map ( )
-- u2: display_7seg port map ( )
u3: Comparador4bits port map(eaSUB,ebSUB,sCOMP);
u4: TROCADOR port map(eaSUB,ebSUB,sCOMP(0),s0TROCADOR,s1TROCADOR);
u5: subtrator4bits port map(s0TROCADOR,s1TROCADOR,sSUB);
u6: display_7seg port map (sSUB,sSUB_display);
  
  
END;

