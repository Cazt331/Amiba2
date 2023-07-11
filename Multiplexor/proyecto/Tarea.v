`timescale 1ns / 1ps

module DisplayController(
    input [7:0] switches,
    output reg [6:0] display1,
    output reg [6:0] display2
);

    always @(*) begin
        case(switches[3:0])
            4'h0: display1 = 7'b1000000;  // N�mero 0
            4'h1: display1 = 7'b1111001;  // N�mero 1
            4'h2: display1 = 7'b0100100;  // N�mero 2
            4'h3: display1 = 7'b0110000;  // N�mero 3
            4'h4: display1 = 7'b0011001;  // N�mero 4
            4'h5: display1 = 7'b0010010;  // N�mero 5
            4'h6: display1 = 7'b0000010;  // N�mero 6
            4'h7: display1 = 7'b1111000;  // N�mero 7
            4'h8: display1 = 7'b0000000;  // N�mero 8
            4'h9: display1 = 7'b0011000;  // N�mero 9
            4'ha: display1 = 7'b0001000;  // N�mero 10 (A en hexadecimal)
            4'hb: display1 = 7'b0000011;  // N�mero 11 (B en hexadecimal)
            4'hc: display1 = 7'b1000110;  // N�mero 12 (C en hexadecimal)
            4'hd: display1 = 7'b0100001;  // N�mero 13 (D en hexadecimal)
            4'he: display1 = 7'b0000110;  // N�mero 14 (E en hexadecimal)
            4'hf: display1 = 7'b0001110;  // N�mero 15 (F en hexadecimal)
            default: display1 = 7'b0000000;  // Apagar display1 si el valor es inv�lido
        endcase
		  
        case(switches[7:4])
            4'h0: display2 = 7'b1000000;  // N�mero 0
            4'h1: display2 = 7'b1111001;  // N�mero 1
            4'h2: display2 = 7'b0100100;  // N�mero 2
            4'h3: display2 = 7'b0110000;  // N�mero 3
            4'h4: display2 = 7'b0011001;  // N�mero 4
            4'h5: display2 = 7'b0010010;  // N�mero 5
            4'h6: display2 = 7'b0000010;  // N�mero 6
            4'h7: display2 = 7'b1111000;  // N�mero 7
            4'h8: display2 = 7'b0000000;  // N�mero 8
            4'h9: display2 = 7'b0011000;  // N�mero 9
            4'ha: display2 = 7'b0001000;  // N�mero 10 (A en hexadecimal)
            4'hb: display2 = 7'b0000011;  // N�mero 11 (B en hexadecimal)
            4'hc: display2 = 7'b1000110;  // N�mero 12 (C en hexadecimal)
            4'hd: display2 = 7'b0100001;  // N�mero 13 (D en hexadecimal)
            4'he: display2 = 7'b0000110;  // N�mero 14 (E en hexadecimal)
            4'hf: display2 = 7'b0001110;  // N�mero 15 (F en hexadecimal)
            default: display2 = 7'b0000000;  // Apagar display1 si el valor es inv�lido
				endcase
		end			
	assign AN = 8'b11111100;

endmodule
