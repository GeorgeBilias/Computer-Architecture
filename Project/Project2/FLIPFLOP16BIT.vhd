library ieee;
use ieee.std_logic_1164.all;

package components2 is

--and 
component and_gate2 is
port(x1,x2 : in std_logic;
	  compOut: out std_logic
	  );
end component;

--not 

component not_gate2 is
port(x1 : in std_logic;
	  compOut : out std_logic
	  );
end component;

--nand

component nand_gate is
port(x1,x2 : in std_logic;
	  compOut : out std_logic
	  );
end component;

component FLIPFLOP1BIT is
    port(
        input, Clock, Enable: in std_logic;
        output: out std_logic
    );
end component;

component FLIPFLOP16BIT is
    port(
		  input_array: in std_logic_vector(15 downto 0);
        Clock, Enable: in std_logic;
        output_array: out std_logic_vector(15 downto 0)
    );
end component;

end components2;

library ieee;
use ieee.std_logic_1164.all;

--and 
entity and_gate2 is
port(x1,x2 : in std_logic;
	  compOut: out std_logic
	  );
end and_gate2;

architecture ar_and_gate2 of and_gate2 is

begin

compOut <= x1 and x2;

end ar_and_gate2;

--not 

library ieee;
use ieee.std_logic_1164.all;

entity not_gate2 is
port(x1 : in std_logic;
	  compOut : out std_logic
	  );
end not_gate2;

architecture ar_not_gate2 of not_gate2 is

begin

compOut <= not x1;

end ar_not_gate2;

--nand

library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
port(x1,x2 : in std_logic;
	  compOut : out std_logic
	  );
end nand_gate;

architecture ar_nand_gate of nand_gate is

begin

compOut <= x1 nand x2;

end ar_nand_gate;

library ieee;
use ieee.std_logic_1164.all;
use work.components2.all;

entity FLIPFLOP1BIT is
    port(
        input, Clock, Enable: in std_logic;
        output: out std_logic
    );
end entity FLIPFLOP1BIT;

architecture AR_FLIPFLOP1BIT of FLIPFLOP1BIT is
    signal P1,P2a,P2b,P2,P3,P4: STD_LOGIC;
    signal AfterClock : STD_LOGIC;
    signal S_Q, S_Qbar,S_output: STD_LOGIC;
begin
    
	 AND_1 : and_gate2 port map(Clock,Enable,AfterClock);
	 AND_2: and_gate2 port map(P1,AfterClock,P2a);
	 AND_3: and_gate2 port map(P2a,P4,P2b);
	 
	 NOT_1: not_gate2 port map(P2b,P2);
	 
    NAND_1: nand_gate port map(P4,P1,P3);
    NAND_2: nand_gate port map(P3,AfterClock,P1);
	 NAND_3: nand_gate port map(P2,input,P4);
    NAND_4: nand_gate port map (P1,S_Qbar,S_Q);
	 NAND_5: nand_gate port map (P2,S_Q,S_Qbar);
	 AND_4: and_gate2 port map(S_Q,P2,S_output);
	 
	 output <= S_output;

end architecture AR_FLIPFLOP1BIT;

library ieee;
use ieee.std_logic_1164.all;
use work.components2.all;

entity FLIPFLOP16BIT is
    port(
		  input_array: in std_logic_vector(15 downto 0);
        Clock, Enable: in std_logic;
        output_array: out std_logic_vector(15 downto 0)
    );
end entity FLIPFLOP16BIT;

architecture AR_FLIPFLOP16BIT of FLIPFLOP16BIT is

begin

FF_0: FLIPFLOP1BIT port map(input_array(0),Clock,Enable,output_array(0));
FF_1: FLIPFLOP1BIT port map(input_array(1),Clock,Enable,output_array(1));
FF_2: FLIPFLOP1BIT port map(input_array(2),Clock,Enable,output_array(2));
FF_3: FLIPFLOP1BIT port map(input_array(3),Clock,Enable,output_array(3));
FF_4: FLIPFLOP1BIT port map(input_array(4),Clock,Enable,output_array(4));
FF_5: FLIPFLOP1BIT port map(input_array(5),Clock,Enable,output_array(5));
FF_6: FLIPFLOP1BIT port map(input_array(6),Clock,Enable,output_array(6));
FF_7: FLIPFLOP1BIT port map(input_array(7),Clock,Enable,output_array(7));
FF_8: FLIPFLOP1BIT port map(input_array(8),Clock,Enable,output_array(8));
FF_9: FLIPFLOP1BIT port map(input_array(9),Clock,Enable,output_array(9));
FF_10: FLIPFLOP1BIT port map(input_array(10),Clock,Enable,output_array(10));
FF_11: FLIPFLOP1BIT port map(input_array(11),Clock,Enable,output_array(11));
FF_12: FLIPFLOP1BIT port map(input_array(12),Clock,Enable,output_array(12));
FF_13: FLIPFLOP1BIT port map(input_array(13),Clock,Enable,output_array(13));
FF_14: FLIPFLOP1BIT port map(input_array(14),Clock,Enable,output_array(14));
FF_15: FLIPFLOP1BIT port map(input_array(15),Clock,Enable,output_array(15));

end architecture AR_FLIPFLOP16BIT;

