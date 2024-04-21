-- COMPUTER ARCHITECTURE PROJECT 1

-- ALU 16 BIT MADE BY

-- GEORGIOS BILIAS 3200278
-- IOANNIS PATOUCHAS 3200149
-- GEORGIOS PAPAGEORGIOU 3200227

library ieee;
use ieee.std_logic_1164.all;
use work.ALU_1BIT_Components.all;

--PACKAGE OF COMPONENTS

package ALU_16BIT_Components is

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

end package ALU_16BIT_Components;

--entity of Control Circuit

library ieee;
use ieee.std_logic_1164.all;
use work.ALU_1BIT_Components.all;

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
use work.ALU_1BIT_Components.all;
use work.ALU_16BIT_Components.all;

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