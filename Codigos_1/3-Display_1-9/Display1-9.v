`timescale 1ns / 1ps

module Display1_9(
	 input A,
    input B,
    input C,
    input D,
    output [7:0] Salida,
    output [7:0] AN
    );
assign AN[7] = 1;
assign AN[6] = 1;
assign AN[5] = 1;
assign AN[4] = 1;
assign AN[3] = 1;
assign AN[2] = 1;
assign AN[1] = 1;
assign AN[0] = 0;

assign Salida[7] = (~A&~B&~C&D)|(~A&B&~C&~D);
assign Salida[6] = (~A&B&~C&D)|(~A&B&C&~D);
assign Salida[5] = (~A&~B&C&~D);
assign Salida[4] = (~A&B&~C&~D)|(~A&B&C&D)|(~B&~C&D);
assign Salida[3] = (~A&B&~C)|(~A&D)|(~B&~C&D);
assign Salida[2] = (~A&~B&C)|(~A&~B&D)|(~A&C&D);
assign Salida[1] = (~A&~B&~C)|(~A&B&C&D);
assign Salida[0] = 1;

endmodule
