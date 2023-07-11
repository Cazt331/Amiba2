`timescale 1ns / 1ps

module Maquina_de_estados(
    input switches,
    output wire led,
    input wire clk,
    input wire reset    
);
    parameter [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;       // Parámetros para definir los estados
    reg [1:0] state, next_state;     					// Señales internas

	 always @(posedge clk, negedge reset)			// Proceso de la máquina de estado
      state <= ~reset ? S0 : next_state;

    always @(state, switches) begin     				// Lógica de transición y estado siguiente
        case (state)
            S0: begin
                if (switches == 2'b10)
                    next_state = S1;
                else 
                    next_state = S0;
            end

            S1: begin
                if (switches == 2'b11)
                    next_state = S2;
                else
                    next_state = S0;
            end

            S2: begin
                if (switches == 2'b10)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (switches == 2'b01)
                    next_state = S3;
                else
                    next_state = S0;
            end
            default: next_state = S0;
        endcase
    end
	assign led = (state == S3) ? 1'b1 : 1'b0;  // Moore
endmodule