`timescale 1ns/1ns 
module LFSR_tb (
	
);

parameter bits = 4;

reg clk = 0;
reg [bits-1:0] seed = 1;
reg n_rst = 0;

wire [bits:1] out;
wire done;

initial begin 
	# 10;
	seed = 4'b0011;
	n_rst = 0;
	# 10;
	n_rst = 1;
	seed = 4'b0011;
end

initial begin 
	$dumpfile("LFSR_tb.vcd"); 
	$dumpvars;
end

LFSR #(.NUM_BITS(bits)) LFSR1(.clk(clk), .n_rst(n_rst), 
	.seed(seed), .out(out), .LFSR_Done(done));

always @(*) begin
	#10 clk <= ~clk; 
end

endmodule
