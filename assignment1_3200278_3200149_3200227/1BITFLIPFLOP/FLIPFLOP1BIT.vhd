-- COMPUTER ARCHITECTURE PROJECT 1

-- FLIPFLOP 1 BIT MADE BY

-- GEORGIOS BILIAS 3200278
-- IOANNIS PATOUCHAS 3200149
-- GEORGIOS PAPAGEORGIOU 3200227

library ieee;
use ieee.std_logic_1164.all;

package FLIPFLOP1BIT_Components is

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

--flipflop1bit

component FLIPFLOP1BIT is
    port(
        input, Clock, Enable: in std_logic;
        output: out std_logic
    );
end component;

end package FLIPFLOP1BIT_Components;

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
use work.FLIPFLOP1BIT_Components.all;

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