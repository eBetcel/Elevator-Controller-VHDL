entity ComparadorComInput is
port (a : in bit;
	b: in bit;
	input: in bit_vector(2 downto 0); -- input recebidos por outros comparadores
	s: out bit_vector(2 downto 0));
end ComparadorComInput;

architecture structural of ComparadorComInput is
begin

s(0) <= (((a and b) or (not a and not b)) and input(0)); -- equality
s(1) <= ((a and not b) and input(0)) or input(1); -- bigger than
s(2) <= ((b and not a) and input(0)) or input(2); -- less than

end structural;

