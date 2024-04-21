library ieee;
use ieee.std_logic_1164.all;

package FLIPFLOP16BIT_Components is

component FLIPFLOP16BIT is
    port(
		  input_array: in std_logic_vector(15 downto 0);
        Clock, Enable: in std_logic;
        output_array: out std_logic_vector(15 downto 0)
    );
end component;

end package FLIPFLOP16BIT_Components;

library ieee;
use ieee.std_logic_1164.all;
use work.FLIPFLOP1BIT_Components.all;
use work.FLIPFLOP16BIT_Components.all;

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