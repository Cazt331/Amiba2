library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Led is
    Port ( Entrada : in  STD_LOGIC;
           Salida : out  STD_LOGIC);
end Led;

architecture Behavioral of Led is

begin
salida <= '1' WHEN entrada = '1' ELSE
			'0';

end Behavioral;