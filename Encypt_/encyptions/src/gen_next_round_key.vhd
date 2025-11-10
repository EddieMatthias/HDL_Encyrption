Library ieee;
use ieee.std_logic_1164.all;

--Generates the next round key were one key consists of 4 words
--and 1 word consists of 4 bytes
entity nextRoundKey is
    port(input_key:  std_logic_vector(127 downto 0);
         output_key: std_logic_vector(127 downto 0));
end;

--Implement code to divide key into its 4 words, get temporary word,
--then xor every word to get new round key. See below:
--https://www.youtube.com/watch?v=OvipL5OEWCY