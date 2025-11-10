Library ieee;
use ieee.std_logic_1164.all;

--Converts input byte based off of the subbyte tabel for AES
entity sTable is
    port(input_byte:  std_logic_vector(7 downto 0);
         output_byte: std_logic_vector(7 downto 0));
end;

--Implement code to encrypt bytes, e.g.:
--AA => AC
--See below links:
--https://www.redalyc.org/journal/5122/512253718012/html (AES S-box table)
--https://www.youtube.com/watch?v=OvipL5OEWCY