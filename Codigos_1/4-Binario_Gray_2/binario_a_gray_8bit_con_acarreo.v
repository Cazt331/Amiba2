`timescale 1ns / 1ps

module binario_a_gray_8bit_con_acarreo(input [7:0] binario, input cin, output reg [7:0] gray);
    wire [3:0] gray_1;
    wire [3:0] gray_2;
    wire c1;
    
    binario_a_gray_4bit_con_acarreo u1(.binario(binario[3:0]), .cin(1'b1), .gray(gray_1));
    binario_a_gray_4bit_con_acarreo u2(.binario(binario[7:4]), .cin(1'b1), .gray(gray_2));
    
    always @(*) begin
        gray[7] = gray_2[3];
        gray[6] = gray_2[2]; 
        gray[5] = gray_2[1];
        gray[4] = gray_2[0];
        gray[3:0] = gray_1;
       
    end
endmodule