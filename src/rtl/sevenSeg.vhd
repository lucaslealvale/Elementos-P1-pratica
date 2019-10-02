------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 2 - Seven Seg
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
  port (
    H : in  STD_LOGIC_VECTOR(3 downto 0);
    a,b,c,d,e,f,g : out STD_LOGIC );
end entity;

architecture  rtl OF sevenSeg IS

signal vetorH : STD_LOGIC_VECTOR(6 downto 0);


begin

  a <= vetorH(0);
  b <= vetorH(1);
  c <= vetorH(2);
  d <= vetorH(3);
  e <= vetorH(4);
  f <= vetorH(5);
  g <= vetorH(6);

  vetorH <= "1000000" when (H(3 downto 0) = "0000") else
  "1111001" when (H(3 downto 0) = "0001") else
  "0100100" when (H(3 downto 0) = "0010") else
  "0110000" when (H(3 downto 0) = "0011") else
  "0011001" when (H(3 downto 0) = "0100") else
  "0010010" when (H(3 downto 0) = "0101") else
  "0000010" when (H(3 downto 0) = "0110") else
  "1111000" when (H(3 downto 0) = "0111") else
  "0000000" when (H(3 downto 0) = "1000") else
  "0011000";


end architecture;
