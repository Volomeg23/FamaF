module signext (input logic [31:0] a,
					output logic [63:0] y);
	if (a[31:21] === 11'b111_1100_0010) 
		assign y = {a[31:21], {32{a[20]}}, a[19:0]};
		
	else if (a[31:21] === 11'b111_1100_000)
		assign y = {a[31:21], {32{a[20]}}, a[19:0]};
		
	else if (a[31:24] === 8'b101_1010_0) 
		assign y = {a[31:24], {32{a[23]}}, a[22:0]}
	
	else 
		assign y = 64'b0;
		
endmodule