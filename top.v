
module top;

	reg clk = 1'b1;
	reg reset = 1'b1;
	reg [7:0] data_in = 8'h00;
	reg KI = 1'b0;
	
	wire [9:0] code;
	
	encoder_8b10b enc0 (
		.clk(clk),
		.reset(reset),
		.data_in(data_in),
		.KI(KI),
		.code(code)
	);
	
	always @(clk) #10 clk <= ~clk;
	
	initial begin
		#20 
		reset = 1'b0;
		KI = 1'b1;
		data_in = 8'h3c;
		
		#20
		KI = 1'b0;
		data_in = 8'h40;
		
		#100 $stop;
	end

endmodule