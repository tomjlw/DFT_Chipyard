module DFF(D,clk,n_rst,Q);
input D; // Data input 
input clk; // clock input 
input n_rst; // asynchronous reset low level 
output reg Q; // output Q 
always @(posedge clk or negedge n_rst) 
begin
 if(n_rst==1'b0)
  Q <= 1'b0; 
 else 
  Q <= D; 
end 
endmodule 
