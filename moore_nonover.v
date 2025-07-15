module moore_nonover(clk_i,rst_i,valid_i,data_i,pattern_detector_o);
//BCCBC : moore non overlapping
input clk_i,rst_i,valid_i,data_i;
output reg pattern_detector_o;
parameter S_R=6'b000001;
parameter S_B=6'b000010;
parameter S_BC=6'b000100;
parameter S_BCC=6'b001000;
parameter S_BCCB=6'b010000;
parameter S_BCCBC=6'b100000;
parameter B=1'b0;
parameter C=1'b1;
reg [5:0]state,next_state;

always @(posedge clk_i) begin
	if(rst_i==1)begin
		pattern_detector_o=0;
		state=S_R;
		next_state=S_R;
	end
	else begin
		if(valid_i==1) begin
		case (state) //BCCBC
		S_R: begin //reset state
			pattern_detector_o=0;
				if(data_i==B)begin
					next_state=S_B; //00001
				end
				else
				next_state=S_R; //000001
		end
		S_B: begin //1st state
			pattern_detector_o=0;
			if(data_i==B)begin
				next_state=S_BC;
			end
			else
				next_state=S_B;
		end
		S_BC: begin //2nd state
			pattern_detector_o=0;
			if(data_i==B) next_state=S_B;
			else next_state=S_BCC;
		end
		S_BCC: begin //3rd state
			pattern_detector_o=0;
			if(data_i==B) next_state=S_BCCB;
			else next_state=S_R;
		end
		S_BCCB: begin //4th state
			pattern_detector_o=0;
			if(data_i==B) next_state=S_B;
			else next_state=S_BCCBC;
		end
		S_BCCBC: begin //5th state
			pattern_detector_o=1;
			if(data_i==B) next_state=S_B;
			else next_state=S_R;
		end
        default: next_state = S_R;
		endcase
		end
	end
end

always @(next_state) state=next_state;
end
endmodule
