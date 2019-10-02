------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 2 - Cronometro
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cronometro is
  port (
    enable : in std_logic;
    clk : in std_logic;
    a1,b1,c1,d1,e1,f1,g1 : out STD_LOGIC;
    a2,b2,c2,d2,e2,f2,g2 : out STD_LOGIC
    );
end entity;

architecture  rtl OF cronometro IS

  component BCDAdder is
    port(
      x,y      : in STD_LOGIC_VECTOR(3 downto 0);
      carryin  : in std_logic;
      s        : out STD_LOGIC_VECTOR(3 downto 0);
      carryout : out STD_LOGIC
      );
  end component;

  component Register4 is
    port(
      clock:   in STD_LOGIC;
      input:   in STD_LOGIC_VECTOR(3 downto 0);
      load:    in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

  component sevenSeg is
    port (
      H : in  STD_LOGIC_VECTOR(3 downto 0);
      a,b,c,d,e,f,g : out STD_LOGIC );
  end component;

  signal carrOutBCD1 : std_logic;
  signal OutReg1 : STD_LOGIC_VECTOR(3 downto 0);
  signal OutReg2 : STD_LOGIC_VECTOR(3 downto 0);
  signal BCDout1 : STD_LOGIC_VECTOR(3 downto 0);
  signal BCDout2 : STD_LOGIC_VECTOR(3 downto 0);


begin

  BCD1: BCDAdder port map(OutReg1, "0000", '1', BCDout1, carrOutBCD1);
  BCD2: BCDAdder port map(OutReg2, "0000", carrOutBCD1, BCDout2, open);

  REG1: Register4 port map(clk, BCDout1, '1', OutReg1);
  REG2: Register4 port map(clk, BCDout2, '1', OutReg2);

  SEG1: sevenSeg port map(OutReg1,a1,b1,c1,d1,e1,f1,g1);
  SEG2: sevenSeg port map(OutReg2,a2,b2,c2,d2,e2,f2,g2);

end architecture;
