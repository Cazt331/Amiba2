library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Display is
    Port ( Entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           Salida : out  STD_LOGIC_VECTOR (7 downto 0);
			  Led : out  STD_LOGIC_VECTOR (3 downto 0);
			  AN: out STD_LOGIC_VECTOR (7 downto 0));
end Display;

architecture Behavioral of Display is

begin
AN <= "11111110";	
	with Entrada select
		  Salida <= x"03" when "0000",
						x"9F" when "0001",
						x"25" when "0010",
						x"0D" when "0011",
						x"99" when "0100",
						x"49" when "0101",
						x"41" when "0110",
						x"1F" when "0111", 
						x"01" when "1000",
						x"19" when "1001",
						x"11" when "1010",
						x"C1" when "1011",
						x"63" when "1100",
						x"85" when "1101",
						x"61" when "1110",
						x"71" when "1111",
						x"00" when others;
						
		with Entrada select
			  Led <= "0000" when "0000",
						"0001" when "0001",
						"0010" when "0010",
						"0011" when "0011",
						"0100" when "0100",
						"0101" when "0101",
						"0110" when "0110",
						"0111" when "0111", 
						"1000" when "1000",
						"1001" when "1001",
						"1010" when "1010",
						"1011" when "1011",
						"1100" when "1100",
						"1101" when "1101",
						"1110" when "1110",
						"1111" when "1111", 
						"0000" when others; 
end Behavioral;