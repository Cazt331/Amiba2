`timescale 1ns / 1ps

module Reloj_1000Hz(
    input CLK_100MHZ,
    input RST,
    output reg CLK_1HZ,
	 output [7:0] AN
    );
	 
    reg [26:0] count;
    initial CLK_1HZ=1'b1;	 
    
    always @(posedge CLK_100MHZ)
    if ((RST)||(count>=26'h5E69EC0)) begin //100MHZ   5F5E100
        count<=26'h0000000;
        CLK_1HZ<=~CLK_1HZ;
    end
    else begin
        count<=count+26'h0000001;
    end
	 assign AN = 8'b11111111;	//Desactivar displays

endmodule
