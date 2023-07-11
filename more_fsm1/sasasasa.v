`timescale 1ns / 1ps


module Moore_FSM (input In, clk, rst,
                  output Out);
  
 reg [1:0]state, next_state;
 parameter [1:0] idle=2'b00,s1=2'b01,s2=2'b10;
  
  always @(posedge clk, negedge rst)
        state <= ~rst ? idle : next_state;


 always@(state, In)
    case(state)
      idle : 
        if (In)
          next_state =s1;
        else 
          next_state =idle; 
      s1 :
        if (In)
          next_state =s2;
        else 
          next_state =idle; 
      s2 :
        if (In)
          next_state =s2;
        else 
          next_state =idle; 
      default : next_state =idle; 
    endcase
  
  assign Out = (state == s2) ? 1'd1 : 1'd0;  // Moore
 // assign Out = (state == s2 & In) ? 1'd1 : 1'd0;  // Mealy
       
endmodule