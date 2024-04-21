library ieee;
use ieee.std_logic_1164.all;

--PACKAGE OF COMPONENTS

package components is

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

-- Control Circuit

component ControlCircuit is
 port(opcode: in std_logic_vector(2 downto 0);
      I1_Invert,I2_Invert: out std_logic;
		Operation: out std_logic_vector(2 downto 0);
	   CarryIn: out std_logic);
end component;

-- 16 bit ALU

component ALU_16BIT is
 port(I1_array,I2_array: in std_logic_vector(15 downto 0);
      opcode: in std_logic_vector(2 downto 0);
		Result: out std_logic_vector(15 downto 0);
		Overflow: out std_logic);
end component;

-- Component used for not and Geq

component mux_16 is 
	port(I1_array : in std_logic_vector(15 downto 0);
		  Operation : in std_logic_vector(2 downto 0);
		  Result: out std_logic_vector(15 downto 0));		  
end component;

end package components;

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
use work.components.all;

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

--entity of Control Circuit

library ieee;
use ieee.std_logic_1164.all;
use work.components.all;

entity ControlCircuit is
 port(opcode: in std_logic_vector(2 downto 0);
      I1_Invert,I2_Invert: out std_logic;
		Operation: out std_logic_vector(2 downto 0);
	   CarryIn: out std_logic);
end ControlCircuit;	

--architecture of Control Circuit

architecture AR_ControlCircuit of ControlCircuit is
 begin
  process(opcode)
   begin
	 case opcode is
	 --GEQ
	  when "100" =>
		Operation <= "101";
		I1_Invert <= '0';
		I2_Invert <= '0';
		CarryIn <= '0';
	 --NOT
	  when "101" => 
	   Operation <= "100";
		I1_Invert <= '0';
		I2_Invert <= '0';
		CarryIn <= '0';
	 --AND
	  when "010" =>
	   Operation <= "000";
		I1_Invert <= '0';
		I2_Invert <= '0';
		CarryIn <= '0';
	 --OR
	 when "011" =>
	   Operation <= "001";
		I1_Invert <= '0';
		I2_Invert <= '0';
		CarryIn <= '0';
	 --ADD
	 when "000" =>
	   Operation <= "010";
		I1_Invert <= '0';
		I2_Invert <= '0';
		CarryIn <= '0';
	 --SUB
	 when "001" =>
	   Operation <= "010";
		I1_Invert <= '0';
		I2_Invert <= '1';
		CarryIn <= '1';
	 --NOR
	 when "111" =>
	   Operation <= "000";
		I1_Invert <= '1';
		I2_Invert <= '1';
		CarryIn <= '0';
	 --XOR
	 when "110" =>
	   Operation <= "011";
		I1_Invert <= '0';
		I2_Invert <= '0';
		CarryIn <= '0';
	 when others =>
	   Operation <= "000";
		I1_Invert <= '0';
		I2_Invert <= '0';
		CarryIn <= '0';
	 end case;
	 end process;

end AR_ControlCircuit;

--entity of geq and not component

library ieee;
use ieee.std_logic_1164.all;

entity mux_16 is 

	port(I1_array : in std_logic_vector(15 downto 0);
		  Operation : in std_logic_vector(2 downto 0);
		  Result: out std_logic_vector(15 downto 0));
		  
end mux_16;

--architecture of geq and not component

architecture AR_mux_16 of mux_16 is
begin
    process (I1_array, Operation)
        variable temp_result : std_logic_vector(15 downto 0);
    begin
        case Operation is
            when "101" =>             
                temp_result(0) := '1';
                for i in I1_array'range loop
                    temp_result(0) := temp_result(0) and I1_array(i);
                end loop;
					 temp_result(15 downto 1) := (others => '0');
                Result <= temp_result;
				when "100" =>
					 Result(0) <= not I1_array(15);
					 Result(15 downto 1) <= (others => '0');
            when others =>
                Result <= I1_array;
        end case;
    end process;
end AR_mux_16;



--entity of 16 Bit ALU

library ieee;
use ieee.std_logic_1164.all;
use work.components.all;

entity ALU_16BIT is
 port(I1_array,I2_array: in std_logic_vector(15 downto 0);
      opcode: in std_logic_vector(2 downto 0);
		Result: out std_logic_vector(15 downto 0);
		Overflow: out std_logic);
end ALU_16BIT;

--architecture of 16 Bit ALU

architecture AR_ALU_16BIT of ALU_16BIT is

  signal insert_I1,insert_I2,CarryIn: std_logic;
  signal CarryOut: std_logic_vector(0 to 15);
  signal Result_S: std_logic_vector(15 downto 0);
  signal Result_mux:std_logic_vector(15 downto 0);
  signal Operation: std_logic_vector(2 downto 0);
  
  begin
  
  a1:ControlCircuit port map(opcode,insert_I1,insert_I2,Operation,CarryIn);
    
  ALU0: ALU_1BIT port map(I1_array(0),I2_array(0),CarryIn,insert_I1,insert_I2,Operation,Result_S(0),CarryOut(0));
  ALU1: ALU_1BIT port map(I1_array(1),I2_array(1),CarryOut(0),insert_I1,insert_I2,Operation,Result_S(1),CarryOut(1));
  ALU2: ALU_1BIT port map(I1_array(2),I2_array(2),CarryOut(1),insert_I1,insert_I2,Operation,Result_S(2),CarryOut(2));
  ALU3: ALU_1BIT port map(I1_array(3),I2_array(3),CarryOut(2),insert_I1,insert_I2,Operation,Result_S(3),CarryOut(3));
  ALU4: ALU_1BIT port map(I1_array(4),I2_array(4),CarryOut(3),insert_I1,insert_I2,Operation,Result_S(4),CarryOut(4));
  ALU5: ALU_1BIT port map(I1_array(5),I2_array(5),CarryOut(4),insert_I1,insert_I2,Operation,Result_S(5),CarryOut(5));
  ALU6: ALU_1BIT port map(I1_array(6),I2_array(6),CarryOut(5),insert_I1,insert_I2,Operation,Result_S(6),CarryOut(6));
  ALU7: ALU_1BIT port map(I1_array(7),I2_array(7),CarryOut(6),insert_I1,insert_I2,Operation,Result_S(7),CarryOut(7));
  ALU8: ALU_1BIT port map(I1_array(8),I2_array(8),CarryOut(7),insert_I1,insert_I2,Operation,Result_S(8),CarryOut(8));
  ALU9: ALU_1BIT port map(I1_array(9),I2_array(9),CarryOut(8),insert_I1,insert_I2,Operation,Result_S(9),CarryOut(9));
  ALU10: ALU_1BIT port map(I1_array(10),I2_array(10),CarryOut(9),insert_I1,insert_I2,Operation,Result_S(10),CarryOut(10)); 
  ALU11: ALU_1BIT port map(I1_array(11),I2_array(11),CarryOut(10),insert_I1,insert_I2,Operation,Result_S(11),CarryOut(11));
  ALU12: ALU_1BIT port map(I1_array(12),I2_array(12),CarryOut(11),insert_I1,insert_I2,Operation,Result_S(12),CarryOut(12));
  ALU13: ALU_1BIT port map(I1_array(13),I2_array(13),CarryOut(12),insert_I1,insert_I2,Operation,Result_S(13),CarryOut(13));
  ALU14: ALU_1BIT port map(I1_array(14),I2_array(14),CarryOut(13),insert_I1,insert_I2,Operation,Result_S(14),CarryOut(14));
  ALU15: ALU_1BIT port map(I1_array(15),I2_array(15),CarryOut(14),insert_I1,insert_I2,Operation,Result_S(15),CarryOut(15));
  
  MUX1: mux_16 port map(Result_S,opcode,Result_mux);
  
  Result <= Result_mux;
  
  XOR_1: XOR_Gate port map(CarryOut(14),CarryOut(15),Overflow);

end AR_ALU_16BIT;