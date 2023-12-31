`timescale 1ns / 1ps

module FSM(
    input clk,
    input start,
    input [7:0] A, E, K,
    output reg a1, a2, a3, a4, a5, a6, a7
    );
    
     // Maquina de estados
    parameter Esperar = 3'b000, Divisor = 3'b001, Selector = 3'b010, Restar = 3'b011, Sumar = 3'b100, Imprimir = 3'b101;
    reg [2:0] presente;
    reg [2:0] futuro   ;
    
    // registro de estados
    always @(posedge clk)
      begin  
      presente <= futuro;
      end
    
    // logica del estado siguiente    
    always @(*)
      case(presente)
      
      Esperar: 
        if(start == 1'b0)
           futuro = Esperar;
        else
           futuro = Divisor;
      
      Divisor:
        if(A  >= 2*K)
           futuro = Divisor;
        else
           futuro = Selector;
      
      Selector:
         if(K == 1)
            futuro = Imprimir;
         else
            futuro = Restar;
      Restar:
         if(E == 0)
            futuro = Sumar;
         else
            futuro = Divisor;
      Sumar:
         futuro = Divisor;
         
      Imprimir:
         futuro = Esperar;
            
      default:
      futuro = Esperar;
      endcase
    
    // logica de salida
    
    always @(*)
    begin
      case(presente)
      
          Esperar: begin
            a1 <= 1'b0; a2 <= 1'b0; a3 <= 1'b0; a4 <= 1'b0; a5 <= 1'b0; a6 <= 1'b0; a7 <= 1'b1;
            end
          
          Divisor: begin
            a1 <= 1'b1; a2 <= 1'b1; a3 <= 1'b1; a4 <= 1'b1; a5 <= 1'b1; a6 <= 1'b1; a7 <= 1'b1;
            end
          
          Selector: begin
            a1 <= 1'b0; a2 <= 1'b1; a3 <= 1'b1; a4 <= 1'b0; a5 <= 1'b1; a6 <= 1'b1; a7 <= 1'b1;
            end
         
         Restar: begin
            a1 <= 1'b0; a2 <= 1'b0; a3 <= 1'b1; a4 <= 1'b1; a5 <= 1'b1; a6 <= 1'b1; a7 <= 1'b1;
            end
            
          Sumar: begin
            a1 <= 1'b0; a2 <= 1'b1; a3 <= 1'b1; a4 <= 1'b1; a5 <= 1'b1; a6 <= 1'b0;  a7 <= 1'b1;
            end
          
          Imprimir: begin
            a1 <= 1'b0; a2 <= 1'b1; a3 <= 1'b1;  a4 <= 1'b1; a5 <= 1'b1; a6 <= 1'b1; a7 <= 1'b0;
            end
            
          Esperar: begin
            a1 <= 1'b0; a2 <= 1'b0; a3 <= 1'b1; a4 <= 1'b1; a5 <= 1'b1; a6 <= 1'b1; a7 <= 1'b1;
            end       
      endcase
   end
    
endmodule