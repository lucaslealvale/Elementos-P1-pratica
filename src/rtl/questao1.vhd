------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 1
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Questao1 is
  port (
	x : in  STD_LOGIC_VECTOR(4 downto 0);
	f : out STD_LOGIC	);
end entity;

architecture  rtl OF Questao1 IS
signal p1,p6: std_logic;
begin

	p1 <= x(0) or x(1) or x(4);
	
	p6 <= ((x(2) and not x(3)) or (not x(2) and x(3))  );

	f <= (p1 and p6) or (not p1 and not p6);

end architecture;
