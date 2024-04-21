-- COMPUTER ARCHITECTURE PROJECT 1

-- MULTICYCLE CIRCUIT MADE BY

-- GEORGIOS BILIAS 3200278
-- IOANNIS PATOUCHAS 3200149
-- GEORGIOS PAPAGEORGIOU 3200227

library ieee;
use ieee.std_logic_1164.all;
use work.ALU_16BIT_Components.all;
use work.FLIPFLOP16BIT_Components.all;

package MULTICYCLECIRCUIT_Components is 

component MULTICYCLECIRCUIT is
	port(Clock,Enable: in std_logic;
		  Operation: in std_logic_vector(2 downto 0);
		  Input1,Input2: in std_logic_vector(15 downto 0);
		  ALUout,Output,FF1,FF2: out std_logic_vector(15 downto 0)
		 );
end component;

end MULTICYCLECIRCUIT_Components;

library ieee;
use ieee.std_logic_1164.all;
use work.ALU_16BIT_Components.all;
use work.FLIPFLOP16BIT_Components.all;
use work.MULTICYCLECIRCUIT_Components.all;

entity MULTICYCLECIRCUIT is
	port(Clock,Enable: in std_logic;
		  Operation: in std_logic_vector(2 downto 0);
		  Input1,Input2: in std_logic_vector(15 downto 0);
		  ALUout,Output,FF1,FF2: out std_logic_vector(15 downto 0);
		  ALUOverflow : out std_logic
		 );
end entity MULTICYCLECIRCUIT;

architecture AR_MULTICYCLECIRCUIT of MULTICYCLECIRCUIT is

signal FF1_out,FF2_out,FF3_out,ALU_Result : std_logic_vector(15 downto 0);
signal ALU_Overflow: std_logic;

begin

FF_1: FLIPFLOP16BIT port map(Input1,Clock,Enable,FF1_out);
FF_2: FLIPFLOP16BIT port map(Input2,Clock,Enable,FF2_out);
ALU_1: ALU_16BIT port map(FF1_out,FF2_out,Operation,ALU_Result,ALU_Overflow);
FF_3: FLIPFLOP16BIT port map(ALU_Result,Clock,Enable,FF3_out);

ALUout <= ALU_Result;
FF1 <= FF1_out;
FF2 <= FF2_out;
Output <= FF3_out;
ALUOverflow <= ALU_Overflow;

end architecture AR_MULTICYCLECIRCUIT;