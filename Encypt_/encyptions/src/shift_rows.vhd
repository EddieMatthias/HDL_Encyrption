Library ieee;

use ieee.std_logic_1164.all;

entity rowShift is
    port(original_key: in std_logic_vector(127 downto 0);
         shifted_key:  out std_logic_vector(127 downto 0));
end entity;