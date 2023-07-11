`timescale 1ns / 1ps

module Multiplexor(
	input Reloj,
	output reg [7:0] Displays, Segmentos,
	input [3:0] A,[3:0] B
);
	reg [29:0] Contador;
	reg [1:0] Seleccion = 2'b00;
	wire [3:0] ResulAND, ResulOR;
	reg [3:0] A0;
	
	always @(posedge Reloj) begin
		if (Contador < 30'd100_000) begin 
			Contador <= Contador + 1'd1;
		end else begin
			Seleccion <= Seleccion + 1'd1;
			Contador <= 0;
		end
	end

	always @(Seleccion) begin
		case (Seleccion)
			2'b00: begin Displays <= 8'b11111110; A0 <= A; end
			2'b01: begin Displays <= 8'b11111101; A0 <= B; end
			2'b10: begin Displays <= 8'b11111011; A0 <= ResulAND; end
			2'b11: begin Displays <= 8'b11110111; A0 <= ResulOR; end
			default: begin Displays <= 8'b11111111; A0 <= 4'b1111; end
		endcase
	end
	
	    always @(*) begin
        case(A0)
            4'h0: Segmentos <= 8'b11000000;  // N�mero 0
            4'h1: Segmentos <= 8'b11111001;  // N�mero 1
            4'h2: Segmentos <= 8'b10100100;  // N�mero 2
            4'h3: Segmentos <= 8'b10110000;  // N�mero 3
            4'h4: Segmentos <= 8'b10011001;  // N�mero 4
            4'h5: Segmentos <= 8'b10010010;  // N�mero 5
            4'h6: Segmentos <= 8'b10000010;  // N�mero 6
            4'h7: Segmentos <= 8'b11111000;  // N�mero 7
            4'h8: Segmentos <= 8'b10000000;  // N�mero 8
            4'h9: Segmentos <= 8'b10011000;  // N�mero 9
            4'ha: Segmentos <= 8'b10001000;  // N�mero 10 (A en hexadecimal)
            4'hb: Segmentos <= 8'b10000011;  // N�mero 11 (B en hexadecimal)
            4'hc: Segmentos <= 8'b11000110;  // N�mero 12 (C en hexadecimal)
            4'hd: Segmentos <= 8'b10100001;  // N�mero 13 (D en hexadecimal)
            4'he: Segmentos <= 8'b10000110;  // N�mero 14 (E en hexadecimal)
            4'hf: Segmentos <= 8'b10001110;  // N�mero 15 (F en hexadecimal)
            default: Segmentos <= 8'b10000000;  // Apagar display1 si el valor es inv�lido
        endcase
		end
	
	assign ResulAND = (A & B); // SUMATORIA(AND)
	assign ResulOR = (A | B);  // SUMATORIA(OR)

endmodule