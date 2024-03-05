
module control_rom (

	input  wire [7:0] data_in,
	input  wire       current_rd,
	output reg  [9:0] code,
	output reg        next_rd

);

	parameter same = 1'b0;
	parameter flip = 1'b1;
	
	always @(*) begin
		case ({data_in, current_rd})
			9'b000_11100_0: begin code = 10'b001111_0100; next_rd = same; end
			9'b000_11100_1: begin code = 10'b110000_1011; next_rd = same; end
			9'b001_11100_0: begin code = 10'b001111_1001; next_rd = flip; end
			9'b001_11100_1: begin code = 10'b110000_0110; next_rd = flip; end
			9'b010_11100_0: begin code = 10'b001111_0101; next_rd = flip; end
			9'b010_11100_1: begin code = 10'b110000_1010; next_rd = flip; end
			9'b011_11100_0: begin code = 10'b001111_0011; next_rd = flip; end
			9'b011_11100_1: begin code = 10'b110000_1100; next_rd = flip; end
			9'b100_11100_0: begin code = 10'b001111_0010; next_rd = same; end
			9'b100_11100_1: begin code = 10'b110000_1101; next_rd = same; end
			9'b101_11100_0: begin code = 10'b001111_1010; next_rd = flip; end
			9'b101_11100_1: begin code = 10'b110000_0101; next_rd = flip; end
			9'b110_11100_0: begin code = 10'b001111_0110; next_rd = flip; end
			9'b110_11100_1: begin code = 10'b110000_1001; next_rd = flip; end
			9'b111_11100_0: begin code = 10'b001111_1000; next_rd = same; end
			9'b111_11100_1: begin code = 10'b110000_0111; next_rd = same; end
			9'b111_10111_0: begin code = 10'b111010_1000; next_rd = same; end
			9'b111_10111_1: begin code = 10'b000101_0111; next_rd = same; end
			9'b111_11011_0: begin code = 10'b110110_1000; next_rd = same; end
			9'b111_11011_1: begin code = 10'b001001_0111; next_rd = same; end
			9'b111_11101_0: begin code = 10'b101110_1000; next_rd = same; end
			9'b111_11101_1: begin code = 10'b010001_0111; next_rd = same; end
			9'b111_11110_0: begin code = 10'b011110_1000; next_rd = same; end
			9'b111_11110_1: begin code = 10'b100001_0111; next_rd = same; end
			
			default: begin code = 10'b0; next_rd = same; end
		endcase
	end
endmodule
