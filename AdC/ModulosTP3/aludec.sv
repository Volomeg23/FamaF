// ALU CONTROL DECODER

module aludec (input  logic [10:0] funct,  
					input  logic [1:0]  aluop,  
					output logic [3:0] AluControl);  				
						
	always_comb
		if (aluop == 2'b00) AluControl = 4'b0010;			// LDUR or STUR		
		else if (aluop == 2'b01) AluControl = 4'b0111; 	//CBZ
		else if((aluop == 2'b10)  & (funct == 11'b10001011000)) AluControl = 4'b0010;	//ADD
		else if((aluop == 2'b10)  & (funct == 11'b11001011000)) AluControl = 4'b0110;	//SUB
		else if((aluop == 2'b10)  & (funct == 11'b10001010000)) AluControl = 4'b0000;	//AND
		else if((aluop == 2'b10)  & (funct == 11'b10101010000)) AluControl = 4'b0001;	//OR    
		else AluControl = 4'b0000;
endmodule