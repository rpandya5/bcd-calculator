module part4(SW, LEDR, HEX5, HEX3, HEX1, HEX0);

	input [8:0] SW;
	output [9:0] LEDR; // leds
	output [6:0] HEX5, HEX3, HEX1, HEX0; // 7 seg display
	
	// GET TWO INPUTS FROM USER IN BINARY + DISPLAY (part1)
	wire [3:0] x, y;
	
	assign x[3:0] = SW[7:4];
	assign y[3:0] = SW[3:0];
	
	display h5(HEX5, x);
	display h3(HEX3, y);
	
	// ADD TWO THINGS TOGETHER (part3)
	wire ci;
	wire [3:0] s, c;
	assign ci = SW[8];
	
	adder f1(x[0], y[0], ci, s[0], c[0]);
	
	assign LEDR[0] = s[0];
	
	adder f2(x[1], y[1], c[0], s[1], c[1]);
	
	assign LEDR[1] = s[1];
	
	adder f3(x[2], y[2], c[1], s[2], c[2]);
	
	assign LEDR[2] = s[2];
	
	adder f4(x[3], y[3], c[2], s[3], c[3]);
	
	assign LEDR[3] = s[3];
	
	assign LEDR[4] = c[3];

	
	// BINARY TO DECIMAL CONVERSION (PART 2)
	wire [3:0] z, a, M, v;
	
	assign v[3:0] = s[3:0];
	
	// figure out 10s place. can be 0 / 1
	assign z[0] = ((v[3] & v[2]) | (v[3] & v[1]));
	assign z[1] = 0;
	assign z[2] = 0;
	assign z[3] = 0;
	
	// CIRCUIT A
	assign a[3] = 0;
	assign a[2] = (v[1] & v[2]);
	assign a[1] = (~v[1] & v[2]);
	assign a[0] = v[0];
	
	// MUX
	assign M[0] = (~z[0] & v[0]) | (z[0] & a[0]);
	
	assign M[1] = (~z[0] & v[1]) | (z[0] & a[1]);
	
	assign M[2]= (~z[0] & v[2]) | (z[0] & a[2]);
	
	assign M[3]= (~z[0] & v[3]) | (z[0] & a[3]);
	
	
	// FOR 16 - 19
	
	wire [3:0] a2, M2;
	
	assign a2 = M + 4'b0110;
	
	assign M2[0] = (~c[3] & M[0]) | (c[3] & a2[0]);
	
	assign M2[1] = (~c[3] & M[1]) | (c[3] & a2[1]);
	
	assign M2[2]= (~c[3] & M[2]) | (c[3] & a2[2]);
	
	assign M2[3]= (~c[3] & M[3]) | (c[3] & a2[3]);
	
	
	display h1(HEX1, (c[3] | z));
	display h0(HEX0, M2);
	
	// CHECKER
	
	wire r1, r2;
	assign r1 = ((x[3] & x[2]) | (x[3] & x[1]));
	assign r2 = ((y[3] & y[2]) | (y[3] & y[1]));
	
	assign LEDR[9] = (r1 | r2);
	
endmodule

module adder (x, y, ci, s, co);
	input x, y, ci;
	output s, co;
	
	assign co = ((y&x) | (ci & x) | (y & ci));
	assign s = ((y & ~x & ~ci) | (~y & x & ~ci) | (y & x & ci) | (~y & ~x & ci));
endmodule

module display (HEX, a);
	input [3:0] a;
	output [6:0] HEX;
	
	assign HEX[0] = ~(a[3] | a[1] | (a[2] & a[0]) | (~a[2] & ~a[0]));
	assign HEX[1] = ~(~a[2] | (~a[1] & ~a[0]) | (a[1] & a[0]));
	assign HEX[2] = ~(a[2] | ~a[1] | a[0]);
	assign HEX[3] = ~((~a[2] & ~a[0]) | (~a[2] & a[1]) | (a[2] & ~a[1] & a[0]) | (a[1] & ~a[0]));
	assign HEX[4] = ~((~a[2] & ~a[0]) | (a[1] & ~a[0]));
	assign HEX[5] = ~((~a[1] & ~a[0]) | (a[2] & ~a[1]) | (a[2] & ~a[0]) | a[3]);
	assign HEX[6] = ~((~a[2] & a[1]) | (a[2] & ~a[1]) | a[3] |(a[2] & ~a[0]));
endmodule

	