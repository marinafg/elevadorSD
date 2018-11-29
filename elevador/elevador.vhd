

-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library ieee;

entity elevador is
	port
	(
		-- Input ports
		A, B, C, BSA, BSB, BDB, BDC, BIA, BIB, BIC : in std_logic;
		-- Output ports
		ANDAR	: out std_logic_vector (1 DOWNTO 0);
		ABRIR	: out std_logic;
		ANDARD : out std_logic_vector(1 DOWNTO 0);
	);
end elevador;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture sistema of elevador is

	signal aa, bb, cc, an: std_logic_vector(1 DOWNTO 0);
	signal bi: std_logic_vector(1 DOWNTO 0);
	signal sad : std_logic_vector(1 DOWNTO 0);
	
begin	
	process(A, B, C)
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
		end process;
		ANDAR <= an;
		process(BIA, BIB, BIC, BSA, BSB, BDB, BDC)
			begin
			  if BIA = '1' and A = '0' then
				 bi <= "00";
			  elsif BIB = '1' and B = '0' then
				 bi <= "01";
			  elsif BIC = '1' and C = '0' then
				 bi <= "10";
				else
					bi <= "00";
			  end if;
			end process;
		ANDARD <= bi;
		process(bi)
			begin
			  if BIA = '1' then
				 bi <= "00";
			  elsif BIB = '1' then
				 bi <= "01";
			  elsif BIC = '1' then
				 bi <= "10";
				else
					bi <= "00";
			  end if;
			end process;
		ABRIR 
			
		process(BIA, BIB, BIC)
							 
	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)

end sistema;
