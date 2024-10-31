module part2(SW, HEX1, HEX0);
	input [3:0] SW;
	output [0:6] HEX1, HEX0;
	
	wire v3, v2, v1, v0;
	wire [3:0] z, a, M;
	
	assign v3 = SW[3];
	assign v2 = SW[2];
	assign v1 = SW[1];
	assign v0 = SW[0];
	
	// figure out 10s place. can be 0 / 1
	assign z[0] = ((v3 & v2) | (v3 & v1));
	assign z[1] = 0;
	assign z[2] = 0;
	assign z[3] = 0;
		
	// HEX CONVERSIONS FOR THE 10S PLACE
	
	assign HEX1[0] = ~(z[3] | z[1] | (z[2] & z[0]) | (~z[2] & ~z[0]));
	assign HEX1[1] = ~(~z[2] | (~z[1] & ~z[0]) | (z[1] & z[0]));
	assign HEX1[2] = ~(z[2] | ~z[1] | z[0]);
	assign HEX1[3] = ~((~z[2] & ~z[0]) | (~z[2] & z[1]) | (z[2] & ~z[1] & z[0]) | (z[1] & ~z[0]));
	assign HEX1[4] = ~((~z[2] & ~z[0]) | (z[1] & ~z[0]));
	assign HEX1[5] = ~((~z[1] & ~z[0]) | (z[2] & ~z[1]) | (z[2] & ~z[0]) | z[3]);
	assign HEX1[6] = ~((~z[2] & z[1]) | (z[2] & ~z[1]) | z[3] |(z[2] & ~z[0]));
	
	// CIRCUIT A
	assign a[3] = 0;
	assign a[2] = (v1 & v2);
	assign a[1] = (~v1 & v2);
	assign a[0] = v0;
	
	// MUX
	assign M[0] = (~z[0] & v0) | (z[0] & a[0]);
	
	assign M[1] = (~z[0] & v1) | (z[0] & a[1]);
	
	assign M[2]= (~z[0] & v2) | (z[0] & a[2]);
	
	assign M[3]= (~z[0] & v3) | (z[0] & a[3]);
	
	
	// HEX CONVERSIOMS FOR THE 1S PLACE
	
	assign HEX0[0] = ~(M[3] | M[1] | (M[2] & M[0]) | (~M[2] & ~M[0]));
	assign HEX0[1] = ~(~M[2] | (~M[1] & ~M[0]) | (M[1] & M[0]));
	assign HEX0[2] = ~(M[2] | ~M[1] | M[0]);
	assign HEX0[3] = ~((~M[2] & ~M[0]) | (~M[2] & M[1]) | (M[2] & ~M[1] & M[0]) | (M[1] & ~M[0]));
	assign HEX0[4] = ~((~M[2] & ~M[0]) | (M[1] & ~M[0]));
	assign HEX0[5] = ~((~M[1] & ~M[0]) | (M[2] & ~M[1]) | (M[2] & ~M[0]) | M[3]);
	assign HEX0[6] = ~((~M[2] & M[1]) | (M[2] & ~M[1]) | M[3] |(M[2] & ~M[0]));
	
	/*assign HEX0[0] = ~(M[0] | M[2] | (M[1] & M[3]) | (~M[1] & ~M[3]));
	assign HEX0[1] = ~(~M[1] | (~M[2] & ~M[3]) | (M[2] & M[3]));
	assign HEX0[2] = ~(M[1] | ~M[2] | M[3]);
	assign HEX0[3] = ~((~M[1] & ~M[3]) | (~M[1] & M[2]) | (M[1] & ~M[2] & M[3]) | (M[2] & ~M[3]));
	assign HEX0[4] = ~((~M[1] & ~M[3]) | (M[2] & ~M[3]));
	assign HEX0[5] = ~((~M[2] & ~M[3]) | (M[1] & ~M[2]) | (M[1] & ~M[3]) | M[0]);
	assign HEX0[6] = ~((~M[1] & M[2]) | (M[1] & ~M[2]) | M[0] |(M[1] & ~M[3]));*/
	
	
endmodule
