module regfile_tb2 ();
	logic clk;
	logic we3;
	logic [0:4] ra1;
	logic [0:4] ra2;
	logic [0:4] wa3;
	logic [0:63] wd3;
	logic [0:63] rd1;
	logic [0:63] rd2;
	logic [0:4] ra1_testvector [0:31] = '{5'd0,5'd1,5'd2,5'd3,5'd4,5'd5,5'd6,5'd7,5'd8,5'd9,5'd10,5'd11,
														5'd12,5'd13,5'd14,5'd15,5'd16,5'd17,5'd18,5'd19,5'd20,5'd21,5'd22,5'd23,
														5'd24,5'd25,5'd26,5'd27,5'd28,5'd29,5'd30,5'd31};
	logic [0:4] ra2_testvector [0:31] = '{5'd0,5'd1,5'd2,5'd3,5'd4,5'd5,5'd6,5'd7,5'd8,5'd9,5'd10,5'd11,
														5'd12,5'd13,5'd14,5'd15,5'd16,5'd17,5'd18,5'd19,5'd20,5'd21,5'd22,5'd23,
														5'd24,5'd25,5'd26,5'd27,5'd28,5'd29,5'd30,5'd31};
	logic [0:4] wa3_testvector [0:31] = '{5'd0,5'd1,5'd2,5'd3,5'd4,5'd5,5'd6,5'd7,5'd8,5'd9,5'd10,5'd11,
														5'd12,5'd13,5'd14,5'd15,5'd16,5'd17,5'd18,5'd19,5'd20,5'd21,5'd22,5'd23,
														5'd24,5'd25,5'd26,5'd27,5'd28,5'd29,5'd30,5'd31};
			regfile dut(clk,we3,ra1,ra2,wa3,wd3,rd1,rd2);
	
		always     // no sensitivity list, so it always executes
		begin
			clk = 1; #5; clk = 0; #5;
		end
		
	
			always_ff @(posedge clk)
				begin
				ra1=ra1_testvector[0];ra2=ra2_testvector[0];we3=1;wa3=wa3_testvector[0];wd3=64'd32;
				ra1=ra1_testvector[1];ra2=ra2_testvector[1];we3=1;wa3=wa3_testvector[1];wd3=64'd32;
				ra1=ra1_testvector[2];ra2=ra2_testvector[2];we3=1;wa3=wa3_testvector[2];wd3=64'd32;
				ra1=ra1_testvector[3];ra2=ra2_testvector[3];we3=1;wa3=wa3_testvector[3];wd3=64'd32;
				ra1=ra1_testvector[4];ra2=ra2_testvector[4];we3=1;wa3=wa3_testvector[4];wd3=64'd32;
				ra1=ra1_testvector[5];ra2=ra2_testvector[5];we3=1;wa3=wa3_testvector[5];wd3=64'd32;
				ra1=ra1_testvector[7];ra2=ra2_testvector[7];we3=1;wa3=wa3_testvector[7];wd3=64'd32;
				ra1=ra1_testvector[31];ra2=ra2_testvector[31];we3=1;wa3=wa3_testvector[31];wd3=64'd32;
				end
				
endmodule

			
			
			
			
		