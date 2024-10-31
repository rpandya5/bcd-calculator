module part3 (SW, LEDR);

	input [9:0] SW; 
	output [9:0] LEDR; 
	wire [3:0] a, b, s, c;
	wire ci; 
	
	assign ci = SW[8];
	assign a[3:0] = SW[7:4];
	assign b[3:0] = SW[3:0];
	
	adder fA(a[0], b[0], ci, s[0], c[0]);
	assign LEDR[0] = s[0];
	
	adder fB(a[1], b[1], c[0], s[1], c[1]);
	assign LEDR[1] = s[1];
	
	adder fC(a[2], b[2], c[1], s[2], c[2]);
	assign LEDR[2] = s[2];
	
	adder fD(a[3], b[3], c[2], s[3], c[3]);
	assign LEDR[3] = s[3];
	
	assign LEDR[4] = c[3];
	
endmodule

module adder(a, b, ci, s, co);
	
	input a, b, ci; 
	output s, co;
	
	assign co = ((b&a) | (ci & a) | (b & ci));
	assign s = ((b & ~a & ~ci) | (~b & a & ~ci) | (b & a & ci) | (~b & ~a & ci));
	
endmodule
