`timescale 1ns / 1ps

module display(
  input [3:0] Entrada,
  output reg [7:0] Salida,
  output reg [3:0] Led,
  output [7:0] AN
    );

  always @(*)
  begin
    case (Entrada)
      4'b0000: begin Salida = 8'h03; Led = 4'b0000; end
      4'b0001: begin Salida = 8'h9F; Led = 4'b0001; end
      4'b0010: begin Salida = 8'h25; Led = 4'b0010; end
      4'b0011: begin Salida = 8'h0D; Led = 4'b0011; end
      4'b0100: begin Salida = 8'h99; Led = 4'b0100; end
      4'b0101: begin Salida = 8'h49; Led = 4'b0101; end
      4'b0110: begin Salida = 8'h41; Led = 4'b0110; end
      4'b0111: begin Salida = 8'h1F; Led = 4'b0111; end
      4'b1000: begin Salida = 8'h01; Led = 4'b1000; end
      4'b1001: begin Salida = 8'h19; Led = 4'b1001; end
      4'b1010: begin Salida = 8'h11; Led = 4'b1010; end
      4'b1011: begin Salida = 8'hC1; Led = 4'b1011; end
      4'b1100: begin Salida = 8'h63; Led = 4'b1100; end
      4'b1101: begin Salida = 8'h85; Led = 4'b1101; end
      4'b1110: begin Salida = 8'h61; Led = 4'b1110; end
      4'b1111: begin Salida = 8'h71; Led = 4'b1111; end
      default: begin Salida = 8'h00; Led = 4'b0000; end
    endcase
  end
  
  assign AN = 8'b11111110;
  
endmodule
