
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

Entity Multiplezor is
	port(
		Reloj : in std_logic;
		Displays : out std_logic_vector(3 downto 0);
		Segmentos : out std_logic_vector(6 downto 0);
		Displays2 : out std_logic_vector(3 downto 0)
		);
end Multiplezor;

architecture Multi of Multiplezor is

	signal Cuenta : integer range 0 to 100000;
	signal Seleccion : std_logic_vector(1 downto 0) :="00";
	signal Mostrar : std_logic_vector(3 downto 0):="0000";
	signal Num1,Num2,Num3,Num4 :std_logic_vector(6 downto 0);
	
	Begin
	Conteo_Clk: Process(Reloj)
	begin
		if rising_edge(Reloj) then
			if Cuenta < 100000 then
				Cuenta <=Cuenta+1;
			else
				Seleccion<=Seleccion+1;
				Cuenta <=0;
			end if;
		end if;
	end process;
	
	Mostrar_Displays: process(Seleccion)
	begin
		case Seleccion is
					when "00" =>
						Mostrar <="1110";
					when "01" =>
						Mostrar <="1101";
					when "10" =>
						Mostrar <="1011";
					when "11" =>
						Mostrar <="0111";
					when others =>
						Mostrar <="1111";
					end case;
 
		case Mostrar is
					when "1110"=>
				Segmentos <=Num1; ---0
					when "1101"=>
				Segmentos <=Num2; ---1
					when "1011"=>
				Segmentos <=Num3; ---2
					when "0111"=>
				Segmentos <=Num4; ---3
					when others =>
				Segmentos <="1111111";
		end case;
	end process;
		
	Displays<=Mostrar;
	Num1<="1000000";
	Num2<="1111001";
	Num3<="0100100";
	Num4<="0110000";
	Displays2<="1111";

end Multi;