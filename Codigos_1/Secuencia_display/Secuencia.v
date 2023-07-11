`timescale 1ns / 1ps

module Secuencia(
	 input CLK_100MHZ,
    input RST,
    output reg CLK_1HZ,
	 output [7:0] AN
    );
	 
    reg [26:0] count;
	 reg [3:0] x;
	 
    initial CLK_1HZ=1'b1;	 
    
    always @(posedge CLK_100MHZ)
    if ((RST)||(count>=26'h2FAF080)) begin
        count<=26'h0000000;
        CLK_1HZ<=~CLK_1HZ;
		  x=x+4'd1;

			if ( x == 0 )
				AN = 8'b00001110; // Enciende el primer display
			else if( x == 1 )
				AN = 8'b00001101; // Enciende el segundo display
			else if( x == 2 )
				AN = 8'b00001011; // Enciende el tercer display			
			else if( x == 3 ) 
				begin
				AN = 8'b00000111; // Enciende el cuarto display
				x=0;
				end
			end
    else begin
        count<=count+26'h0000001;
    end

endmodule
