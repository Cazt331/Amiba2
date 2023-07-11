`timescale 1ns / 1ps

module binario_a_gray_4bit_con_acarreo(input [3:0] binario, input cin, output reg [3:0] gray);
    always @(*) begin
        gray[3] = ~binario[3] ^ cin;
        gray[2] = binario[2] ^ binario[3];
        gray[1] = binario[1] ^ binario[2];
        gray[0] = binario[0] ^ binario[1];
        
    end
endmodule