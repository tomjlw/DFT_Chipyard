`timescale 1ns/1ns 
module MISR_tb (
	
);

reg [3:0] in_t;
wire [3:0] out_t;
reg clk = 0;
reg n_rst = 0;  
reg done=0;

initial begin
	# 10;
	n_rst = 0;
	in_t = 1011;
	# 10;
	n_rst = 1;
	in_t = 1011; 
	# 10;
	n_rst = 1;
	in_t = 1001;
	# 10;
	n_rst = 1;
	in_t = 0110;
	# 10;
	n_rst = 1;
	in_t = 0110;
	# 10;
	n_rst = 1;
	in_t = 1111;
	done = 1;
end

initial begin 
	$dumpfile("MISR_tb.vcd"); 
	$dumpvars;
end

MISR MISR1(.in(in_t), .clk(clk), .n_rst(n_rst), .out(out_t));

always @(*) begin
	#10 clk <= ~clk; 
end

endmodule
