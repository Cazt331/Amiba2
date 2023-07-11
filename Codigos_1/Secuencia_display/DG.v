`timescale 1ns / 1ps



// Módulo para decodificar un dígito en display de 7 segmentos
module Decodificador7Seg(
    input wire [3:0] digito,
    output wire [6:0] segmentos
);
    
assign segmentos = {
    // a b c d e f g
    7'b0111111,  // 0
    7'b0000110,  // 1
    7'b1011011,  // 2
    7'b1001111,  // 3
    7'b1100110,  // 4
    7'b1101101,  // 5
    7'b1111101,  // 6
    7'b0000111,  // 7
    7'b1111111,  // 8
    7'b1100111   // 9
}[digito];

endmodule


