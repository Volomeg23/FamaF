module alu_tb();
	logic [63:0] a, b;
	logic [3:0] ALUcontrol;
	logic [63:0] result;
	logic zero;
	logic [63:0] a_testvector [0:5] = '{64'h0,64'h1,64'h2,64'h2,64'hFFF,64'hFFFF_FFFF_FFFF_FFFF};
	logic [63:0] b_testvector [0:5] = '{64'h1,64'h0,64'h2,64'h2,64'h1,64'h1};
	
	//no agrego always de clock por que no usa clock la alu
	
	alu dut(a,b,ALUcontrol,result,zero);
	
	initial
		begin
		a = a_testvector[0]; b= b_testvector [0]; ALUcontrol = 4'b0000; #1000; //AND
		a = a_testvector[1]; b= b_testvector [1]; ALUcontrol = 4'b0001; #1000; //OR 
		a = a_testvector[2]; b= b_testvector [2]; ALUcontrol = 4'b0010; #1000; // ADD
		a = a_testvector[3]; b= b_testvector [3]; ALUcontrol = 4'b0110; #1000; // SUB
		a = a_testvector[4]; b= b_testvector [4]; ALUcontrol = 4'b0111; #1000; //pass b
		a = a_testvector[5]; b= b_testvector [5]; ALUcontrol = 4'b0010; #1000; // ADD con overflow
		end
		
endmodule
