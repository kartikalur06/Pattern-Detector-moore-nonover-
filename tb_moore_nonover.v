`include "moore_nonover.v"
module tb;
parameter S_R=6'b000001;
parameter S_B=6'b000010;
parameter S_BBC=6'b000100;
parameter S_BBCC=6'b001000;
parameter S_BBCCB=6'b010000;
parameter S_BBCCBC=6'b100000;
parameter B=1'b0;
parameter C=1'b1;
reg clk_i,rst_i,valid_i,data_i;
wire pattern_detector_o;
integer count;
moore_nonover dut(clk_i,rst_i,valid_i,data_i,pattern_detector_o);
initial begin
	clk_i=0;
	forever #5 clk_i= ~clk_i;
end
initial begin
	rst_i=1;
	valid_i=0;
	data_i=0;
	count=0;
//	repeat(2)
	@(posedge clk_i);
	rst_i=0;

	repeat(500) begin
		@(posedge clk_i);
		valid_i=1;
		data_i=$random;
	end
	@(posedge clk_i);
		valid_i=0;
		data_i=0;
		$display("no. of times pattern detector=%0d",count);
		#50;
		$finish;
end
always @(posedge pattern_detector_o)begin
//	$display("inside pattern detector block");
	count=count+1;
end
endmodule
