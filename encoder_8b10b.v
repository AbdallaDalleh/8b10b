
module encoder_8b10b (

	input wire clk,
	input wire reset,
	input wire [7:0] data_in,
	input wire KI,
	output wire [9:0] code

);

	reg state;
	reg next_state;
	
	wire  current_rd;

	wire       next_rd;
	wire [9:0] data_code;
	wire [9:0] control_code;
	
	parameter state_rd_negative = 1'b0;
	parameter state_rd_positive = 1'b1;
	parameter rd_same = 1'b0;
	parameter rd_flip = 1'b1;
	
	data_rom data (
		.data_in(data_in),
		.current_rd(current_rd),
		.KI(KI),
		.code(code),
		.next_rd(next_rd)
	);

	always @(posedge clk or posedge reset) begin
		if(reset)
			state <= state_rd_negative;
		else
			state <= next_state;
	end
	
	always @(state, current_rd, next_rd) begin
		case (state)
			state_rd_negative:
				next_state <= (next_rd == rd_same) ? state_rd_negative : state_rd_positive;
			
			state_rd_positive:
				next_state <= (next_rd == rd_same) ? state_rd_positive : state_rd_negative;
		endcase
	end
	
	assign current_rd = state;

endmodule