`timescale 1ns / 1ps

module binario_gray( binario, gray );
 
input      [7:0] binario;
output reg [7:0] gray;
 
always@(*)
begin
 
   gray[7] = binario[7];
   gray[6] = binario[7] ^ binario[6];
   gray[5] = binario[6] ^ binario[5];
   gray[4] = binario[5] ^ binario[4];
   gray[3] = binario[4] ^ binario[3];
   gray[2] = binario[3] ^ binario[2];
   gray[1] = binario[2] ^ binario[1];
   gray[0] = binario[1] ^ binario[0];
 
end
endmodule