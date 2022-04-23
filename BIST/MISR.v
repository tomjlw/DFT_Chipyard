module MISR(
	input [3:0] in,
	input clk,
	input n_rst,

	output [3:0] out

	);

wire Q0, Q1, Q2, Q3, tmp;
wire D0, D1, D2, D3;

XOR XOR1(.a(in[0]), .b(Q3), .y(D0));
DFF DFF1(.D(D0),.clk(clk),.n_rst(n_rst),.Q(Q0));
XOR XOR2(.a(in[1]), .b(Q0), .y(D1));
DFF DFF2(.D(D1),.clk(clk),.n_rst(n_rst),.Q(Q1));
XOR XOR3(.a(in[2]), .b(Q1), .y(D2));
DFF DFF3(.D(D2),.clk(clk),.n_rst(n_rst),.Q(Q2));
XOR XOR4(.a(in[3]), .b(Q2), .y(tmp));
XOR XOR5(.a(tmp), .b(Q3), .y(D3));
DFF DFF4(.D(D3),.clk(clk),.n_rst(n_rst),.Q(Q3));

assign out = {Q3, Q2, Q1, Q0};

endmodule
