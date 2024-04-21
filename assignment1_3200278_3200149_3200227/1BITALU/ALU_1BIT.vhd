-- COMPUTER ARCHITECTURE PROJECT 1

-- ALU 1 BIT MADE BY

-- GEORGIOS BILIAS 3200278
-- IOANNIS PATOUCHAS 3200149
-- GEORGIOS PAPAGEORGIOU 3200227

library ieee;
use ieee.std_logic_1164.all;

--PACKAGE OF COMPONENTS

package ALU_1BIT_Components is

--NOT I1 Component

component NOT_I1 is
 port(I1 : in std_logic;
      notI1 :out std_logic);
end  component;

--NOT I2 Component

component NOT_I2 is
 port(I2 : in std_logic;
      notI2 :out std_logic);
end  component;

--AND Gate Component

component AND_Gate is
 port(final_I1,final_I2 : in std_logic;
      outAND : out std_logic);
end component;

--0R Gate Component

component OR_Gate is
 port(final_I1,final_I2 : in std_logic;
      outOR : out std_logic);
end component;

--XOR Gate Component

component XOR_Gate is
 port(final_I1,final_I2 : in std_logic;
      outXOR : out std_logic);
end component;

--mux2to1_I1 component

component mux2to1_I1 is
 port(I1,notI1 : in std_logic;
      I1_Invert: in std_logic;
		final_I1: out std_logic);
end component;

--mux2to1_I2 component

component mux2to1_I2 is
 port(I2,notI2 : in std_logic;
      I2_Invert: in std_logic;
		final_I2: out std_logic);
end component;

--FULL ADDER Component

component FULL_ADDER is
 port(CarryIn,final_I1,final_I2 : in std_logic;
      sum,CarryOut : out std_logic);
end component;

component NOT0 is
 port(I1: in std_logic;
      outNOT0: out std_logic);
end component;

component norm is
 port(I1: in std_logic;
      out_norm: out std_logic);
end component;


--Multiplexer 4to1 for ALU Component

component mux4to1 is
 port(outAND,outOR,sum,outXOR,outNOT0,out_norm : in std_logic;
      Operation : in std_logic_vector(2 downto 0);
      Result: out std_logic);
end component;

--1 BIT ALU Component

component ALU_1BIT is
 port(I1,I2,CarryIn,I1_Invert,I2_Invert : in std_logic;
		Operation:in std_logic_vector(2 downto 0);
      Result,CarryOut: out std_logic);
end component;

end package ALU_1BIT_Components;

--ENTITIES

--entity NOT I1

library ieee;
use ieee.std_logic_1164.all;

entity NOT_I1 is
  port(I1 : in std_logic;
       notI1 : out std_logic);
end NOT_I1;

--architecture of NOT I1

architecture AR_NOT_I1 of NOT_I1 is
 begin
  notI1 <= not I1;
end AR_NOT_I1;

--entity NOT I2

library ieee;
use ieee.std_logic_1164.all;

entity NOT_I2 is
  port(I2 : in std_logic;
       notI2 : out std_logic);
end NOT_I2;

--architecture of NOT I2

architecture AR_NOT_I2 of NOT_I2 is
 begin
  notI2 <= not I2;
end AR_NOT_I2;

--entity of AND Gate

library ieee;
use ieee.std_logic_1164.all;

entity AND_Gate is
 port(final_I1,final_I2 : in std_logic;
      outAND : out std_logic);
end AND_Gate;

--architecture of AND Gate

architecture AR_AND_Gate of AND_Gate is
 begin
  outAND <= final_I1 and final_I2;
end AR_AND_Gate;

--entity of OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity OR_Gate is
 port(final_I1,final_I2 : in std_logic;
      outOR : out std_logic);
end OR_Gate;

--architecture of OR Gate

architecture AR_OR_Gate of OR_Gate is
 begin
  outOR <= final_I1 or final_I2;
end AR_OR_Gate;

--entity of XOR Gate

library ieee;
use ieee.std_logic_1164.all;

entity XOR_Gate is
 port(final_I1,final_I2 : in std_logic;
      outXOR : out std_logic);
end XOR_Gate;

--architecture of XOR Gate

architecture AR_XOR_Gate of XOR_Gate is
 begin
  outXOR <= final_I1 xor final_I2;
end AR_XOR_Gate;

--entity of multiplexer 2to1 for I1 aka I1Inverter

library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_I1 is
 port(I1,notI1 : in std_logic;
      I1_Invert: in std_logic;
      final_I1 : out std_logic);
end mux2to1_I1;

--architecture of multiplexer 2to1 for I1 aka I1Inverter

architecture AR_mux2to1_I1 of mux2to1_I1 is
 begin
  with I1_Invert select
   final_I1 <= I1 when '0',
	  notI1 when others;
end AR_mux2to1_I1;

--entity of multiplexer 2to1 for I2 aka I2Inverter

library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_I2 is
 port(I2,notI2 : in std_logic;
      I2_Invert: in std_logic;
      final_I2 : out std_logic);
end mux2to1_I2;

--architecture of multiplexer 2to1 for I2 aka I2Inverter

architecture AR_mux2to1_I2 of mux2to1_I2 is
 begin
  with I2_Invert select
   final_I2 <= I2 when '0',
	  notI2 when others;
end AR_mux2to1_I2;

--entity of FULL ADDER

library ieee;
use ieee.std_logic_1164.all;

entity FULL_ADDER is
 port(CarryIn,final_I1,final_I2 : in std_logic;
      sum, CarryOut: out std_logic);
end FULL_ADDER;

--architecture of FULL ADDER

architecture AR_FULL_ADDER of FULL_ADDER is
 begin
  CarryOut <= (final_I2 and CarryIn) or (final_I1 and CarryIn) or (final_I1 and final_I2);
  sum <= (final_I1 and not final_I2 and not CarryIn) or (not final_I1 and final_I2 and not CarryIn) or (not final_I1 and not final_I2 and CarryIn) or (final_I1 and final_I2 and CarryIn);
end AR_FULL_ADDER;

--entity of NOT 0

library ieee;
use ieee.std_logic_1164.all;

entity NOT0 is
 port(I1: in std_logic;
      outNOT0: out std_logic);
end NOT0;

----architecture of NOT0

architecture AR_NOT0 of NOT0 is

begin

outNOT0 <= I1 nand '1';

end architecture AR_NOT0;

--entity of norm

library ieee;
use ieee.std_logic_1164.all;

entity norm is
 port(I1: in std_logic;
      out_norm: out std_logic);
end norm;

--architecture of norm

architecture AR_norm of norm is

begin

out_norm <= I1;

end architecture AR_norm;

--entity of multiplexer 4to1 for ALU (CHANGE IT)

library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
 port(outAND,outOR,sum,outXOR,outNOT0,out_norm: in std_logic;
      Operation : in std_logic_vector(2 downto 0);
      Result: out std_logic);
end mux4to1;

--architecture of multiplexer 4to1 for ALU (CHANGE IT)

architecture AR_mux4to1 of mux4to1 is
 begin
  with Operation select
   Result <= outAND when "000",
	  outOR when "001",
	  sum when "010",
	  outNOT0 when "100",
	  out_norm when "101",
	  outXOR when others;
end AR_mux4to1;

--entity of 1 Bit ALU

library ieee;
use ieee.std_logic_1164.all;
use work.ALU_1BIT_Components.all;

entity ALU_1BIT is
 port(I1,I2,CarryIn,I1_Invert,I2_Invert: in std_logic;
		Operation:in std_logic_vector(2 downto 0);
      Result,CarryOut: out std_logic);
end ALU_1BIT;

--architecture of 1 Bit ALU

architecture AR_ALU_1BIT of ALU_1BIT is
 signal notI1,notI2,final_I1,final_I2,outAND,outOR,outXOR,outNOT0,out_norm,sum: std_logic;
 
 begin
  u0: NOT_I1 port map(I1,notI1);
  u1: mux2to1_I1 port map(I1,notI1,I1_Invert,final_I1);
  u2: NOT_I2 port map(I2,notI2);
  u3: mux2to1_I2 port map(I2,notI2,I2_Invert,final_I2);
  u4: AND_Gate port map(final_I1,final_I2,outAND);
  u5: OR_Gate port map(final_I1,final_I2,outOR);
  u6: FULL_ADDER port map(CarryIn,final_I1,final_I2,sum,CarryOut);
  u7: XOR_Gate port map(final_I1,final_I2,outXOR);
  u8: NOT0 port map(final_I1,outNOT0);
  u9: norm port map(final_I1,out_norm);
  u10: mux4to1 port map(outAND,outOR,sum,outXOR,outNOT0,out_norm,Operation,Result);
  
end AR_ALU_1BIT;