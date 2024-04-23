module alu #(parameter N=64)
				(input logic [N-1:0] a, b,
				input logic [3:0] ALUcontrol,
				output logic [N-1:0] result,
				output logic zero);
	always_comb
		begin // tengo mas de un statement
			casez (ALUcontrol)
			4'b0000: result = a & b;
			4'b0001: result = a | b;
			4'b0010: result = a + b;
			4'b0110: result = a - b;
			4'b0111: result = b;
			default: result = '1;
	endcase
	zero = ~(|result);
	end
endmodule 