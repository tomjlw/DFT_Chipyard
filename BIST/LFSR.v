module LFSR (
	input clk,
	input n_rst,
	input stop,
	input [NUM_BITS-1:0] seed,

	output [NUM_BITS-1:0] out,
   	output LFSR_Done
	);

	parameter NUM_BITS = 4;

	reg [NUM_BITS:1] reg_LFSR = 0;
	reg [NUM_BITS:1] next_LFSR = 0;
	reg feedback;

	always @(posedge clk or negedge n_rst) begin
		if (~n_rst & ~stop) begin
			reg_LFSR <= seed;
			next_LFSR <= 0;
		end
		else if (n_rst & ~stop) begin
			reg_LFSR <= {next_LFSR[NUM_BITS-1:1], feedback};
		end
	end

	always @(*) begin
		next_LFSR = reg_LFSR;

		case (NUM_BITS)
		3: begin
          feedback = next_LFSR[3] ^~ next_LFSR[2];
        end
        4: begin
          feedback = next_LFSR[4] ^~ next_LFSR[3];
        end
        5: begin
          feedback = next_LFSR[5] ^~ next_LFSR[3];
        end
        6: begin
          feedback = next_LFSR[6] ^~ next_LFSR[5];
        end
        7: begin
          feedback = next_LFSR[7] ^~ next_LFSR[6];
        end
        8: begin
          feedback = next_LFSR[8] ^~ next_LFSR[6] ^~ next_LFSR[5] ^~ next_LFSR[4];
        end
        9: begin
          feedback = next_LFSR[9] ^~ next_LFSR[5];
        end
        10: begin
          feedback = next_LFSR[10] ^~ next_LFSR[7];
        end
        11: begin
          feedback = next_LFSR[11] ^~ next_LFSR[9];
        end
        12: begin
          feedback = next_LFSR[12] ^~ next_LFSR[6] ^~ next_LFSR[4] ^~ next_LFSR[1];
        end
        13: begin
          feedback = next_LFSR[13] ^~ next_LFSR[4] ^~ next_LFSR[3] ^~ next_LFSR[1];
        end
        14: begin
          feedback = next_LFSR[14] ^~ next_LFSR[5] ^~ next_LFSR[3] ^~ next_LFSR[1];
        end
        15: begin
          feedback = next_LFSR[15] ^~ next_LFSR[14];
        end
        16: begin
          feedback = next_LFSR[16] ^~ next_LFSR[15] ^~ next_LFSR[13] ^~ next_LFSR[4];
          end
        17: begin
          feedback = next_LFSR[17] ^~ next_LFSR[14];
        end
        18: begin
          feedback = next_LFSR[18] ^~ next_LFSR[11];
        end
        19: begin
          feedback = next_LFSR[19] ^~ next_LFSR[6] ^~ next_LFSR[2] ^~ next_LFSR[1];
        end
        20: begin
          feedback = next_LFSR[20] ^~ next_LFSR[17];
        end
        21: begin
          feedback = next_LFSR[21] ^~ next_LFSR[19];
        end
        22: begin
          feedback = next_LFSR[22] ^~ next_LFSR[21];
        end
        23: begin
          feedback = next_LFSR[23] ^~ next_LFSR[18];
        end
        24: begin
          feedback = next_LFSR[24] ^~ next_LFSR[23] ^~ next_LFSR[22] ^~ next_LFSR[17];
        end
        25: begin
          feedback = next_LFSR[25] ^~ next_LFSR[22];
        end
        26: begin
          feedback = next_LFSR[26] ^~ next_LFSR[6] ^~ next_LFSR[2] ^~ next_LFSR[1];
        end
        27: begin
          feedback = next_LFSR[27] ^~ next_LFSR[5] ^~ next_LFSR[2] ^~ next_LFSR[1];
        end
        28: begin
          feedback = next_LFSR[28] ^~ next_LFSR[25];
        end
        29: begin
          feedback = next_LFSR[29] ^~ next_LFSR[27];
        end
        30: begin
          feedback = next_LFSR[30] ^~ next_LFSR[6] ^~ next_LFSR[4] ^~ next_LFSR[1];
        end
        31: begin
          feedback = next_LFSR[31] ^~ next_LFSR[28];
        end
        32: begin
          feedback = next_LFSR[32] ^~ next_LFSR[22] ^~ next_LFSR[2] ^~ next_LFSR[1];
        end
      endcase 
	end

    assign out = reg_LFSR[NUM_BITS:1];
  	assign LFSR_Done = stop ? 1'b1 : 1'b0;

endmodule
