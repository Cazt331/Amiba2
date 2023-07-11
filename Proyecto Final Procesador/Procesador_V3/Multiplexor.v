`timescale 1ns / 1ps

module Multiplexor (
	input wire Clk,
	output reg [7:0] Displays, Segmentos,
	input wire [7:0] N,
	input Salida
);
	reg [29:0] Contador;
	reg [1:0] Seleccion = 2'b00;
	reg [3:0] A0; 
	reg [3:0] a, b, c;
	
	always @(posedge Clk) begin
		if (Contador < 30'd100_000) begin 
			Contador <= Contador + 1'd1;
		end else begin
			Seleccion <= Seleccion + 1'd1;
			Contador <= 0;
		end
	end

	always @(Seleccion) begin
		case (Seleccion)
			2'b00: begin Displays <= 8'b11111110; A0 <= a; end
			2'b01: begin Displays <= 8'b11111101; A0 <= b; end
			2'b10: begin Displays <= 8'b11111011; A0 <= c; end
			default: begin Displays <= 8'b11111111; end
		endcase
	end
	
	always @(A0) begin
		case (A0)
			4'h0: Segmentos <= 8'b11000000;  // Número 0
			4'h1: Segmentos <= 8'b11111001;  // Número 1
			4'h2: Segmentos <= 8'b10100100;  // Número 2
			4'h3: Segmentos <= 8'b10110000;  // Número 3
			4'h4: Segmentos <= 8'b10011001;  // Número 4
			4'h5: Segmentos <= 8'b10010010;  // Número 5
			4'h6: Segmentos <= 8'b10000010;  // Número 6
			4'h7: Segmentos <= 8'b11111000;  // Número 7
			4'h8: Segmentos <= 8'b10000000;  // Número 8
			4'h9: Segmentos <= 8'b10011000;  // Número 9
			default: Segmentos <= 8'b10000000;  // Apagar display1 si el valor es inválido
		endcase
	end

	always @(*) begin
	if(Salida == 1) begin
		case (N)
			8'b00000100:  begin c <= 4'b0000; b <= 4'b0000; a <= 4'b0100; end
			8'b00001001:  begin c <= 4'b0000; b <= 4'b0000; a <= 4'b1001; end
			8'b00011001:  begin c <= 4'b0000; b <= 4'b0010; a <= 4'b0101; end
			8'b00110001:  begin c <= 4'b0000; b <= 4'b0100; a <= 4'b1001; end
			8'b01111001:  begin c <= 4'b0001; b <= 4'b0010; a <= 4'b0101; end
			8'b10101001:  begin c <= 4'b0001; b <= 4'b0110; a <= 4'b1001; end
			default: begin c <= 4'b0000; b <= 4'b0000; a <= 4'b0000; end  
		endcase
	end
	else begin   c	<= 4'b0000; b <= 4'b0000; a <= 4'b0000; end
	
	end

endmodule