`timescale 1ns / 1ps

module Moore_FSM (
  input wire clk,
  input wire reset,
  input wire data_in,
  output reg salida
);

  // Definición de estados
  reg [2:0] state;
  localparam IDLE = 3'b000;
  localparam S1 = 3'b001;
  localparam S2 = 3'b010;
  localparam S3 = 3'b011;
  localparam S4 = 3'b100;
  localparam S5 = 3'b101;
  localparam MATCH = 3'b110;
 
   always @(posedge clk, negedge reset)
    	state <= ~reset ? IDLE : state;

  // Lógica de la máquina de estado
  always @(posedge clk, negedge reset) begin
	if (!reset) begin
		state <= IDLE;
		salida <= 0;
	end else begin
  	case (state)
    	IDLE:
      	if (data_in)
        	state <= S1;
    	S1:
      	if (data_in)
        	state <= S2;
      	else
        	state <= IDLE;
    	S2:
      	if (data_in)
        	state <= S3;
      	else
        	state <= IDLE;
    	S3:
      	if (!data_in)
        	state <= S4;
      	else
        	state <= IDLE;
    	S4:
      	if (data_in)
        	state <= S5;
      	else
        	state <= IDLE;
    	S5:
      	if (data_in)begin
        	state <= MATCH;
      	end
      	else
        	state <= IDLE;
    	MATCH:
      	state <= IDLE;
  	endcase
	salida = (state !== MATCH) ? 1'd1 : 1'd0;
  end
  
  end
   //salida = (state !== MATCH) ? 1'd1 : 1'd0;     // Moore
endmodule