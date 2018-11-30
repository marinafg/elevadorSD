

-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library ieee;
use ieee.std_logic_1164.all;

entity elevador is
	port
	(
		-- Input ports
		A, B, C, BSA, BSB, BDB, BDC, BIA, BIB, BIC : in std_logic;
		-- Output ports
		ANDARATIVO	: out std_logic_vector (1 DOWNTO 0);
		ABRIRPORTA	: out std_logic;
		ANDARDESTNO : out std_logic_vector(1 DOWNTO 0)
	);
end elevador;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture sistema of elevador is

	signal an: std_logic_vector(1 DOWNTO 0);
	signal bi: std_logic_vector(1 DOWNTO 0);
	signal ab : std_logic;
	
begin	
		process(bi, A, B, C)
			begin
			  if A = '1' then
				 an <= "00";
			  elsif B = '1' then
				 an <= "01";
			  elsif C = '1' then
				 an <= "10";
				else
				an <= "00";
			  end if;
			end process;
		ANDARATIVO <= an;
		
		process(BIA, BIB, BIC, BSA, BSB, BDB, BDC,  A, B, C)
			begin
			  if (BIA = '1' and A = '0') or (BSA = '1' and A = '0') then
				 bi <= "00";
			  elsif (BIB = '1' and B = '0') or (BSB = '1' and B = '0') or (BDB = '1' and B = '0') then
				 bi <= "01";
			  elsif (BIC = '1' and C = '0') or (BDC = '1' and C = '0') then
				 bi <= "10";
				else
					bi <= "00";
			  end if;
			end process;
		ANDARDESTNO <= bi;
		
		process(an, bi)
			begin
			  if (an = "00") and (bi = "00") then
				 ab <= '1';
			  elsif (an = "01") and (bi = "01") then
				 ab <= '1';
			  elsif (an = "10") and (bi = "10") then
				 ab <= '1';
				else
					ab <='0';
			  end if;
			end process;
		ABRIRPORTA <= ab;	
end sistema;
