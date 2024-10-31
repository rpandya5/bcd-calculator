module part1(SW, LEDR, HEX1, HEX0);
	input [7:0] SW;
	output [7:0] LEDR; // leds
	output [6:0] HEX1, HEX0; // 7 seg display
	
	
	assign LEDR = SW;
	
	wire a0, b0, c0, d0, a1, b1, c1, d1;
	
	assign a0 = SW[3];
	assign b0 = SW[2];
	assign c0 = SW[1];
	assign d0 = SW[0];
	
	assign a1 = SW[7];
	assign b1 = SW[6];
	assign c1 = SW[5];
	assign d1 = SW[4];
	
			
	assign HEX0[0] = ~(a0 | c0 | (b0 & d0) | (~b0 & ~d0));
	assign HEX0[1] = ~(~b0 | (~c0 & ~d0) | (c0 & d0));
	assign HEX0[2] = ~(b0 | ~c0 | d0);
	assign HEX0[3] = ~((~b0 & ~d0) | (~b0 & c0) | (b0 & ~c0 & d0) | (c0 & ~d0));
	assign HEX0[4] = ~((~b0 & ~d0) | (c0 & ~d0));
	assign HEX0[5] = ~((~c0 & ~d0) | (b0 & ~c0) | (b0 & ~d0) | a0);
	assign HEX0[6] = ~((~b0 & c0) | (b0 & ~c0) | a0 |(b0 & ~d0));
	
	assign HEX1[0] = ~(a1 | c1 | (b1 & d1) | (~b1 & ~d1));
	assign HEX1[1] = ~(~b1 | (~c1 & ~d1) | (c1 & d1));
	assign HEX1[2] = ~(b1 | ~c1 | d1);
	assign HEX1[3] = ~((~b1 & ~d1) | (~b1 & c1) | (b1 & ~c1 & d1) | (c1 & ~d1));
	assign HEX1[4] = ~((~b1 & ~d1) | (c1 & ~d1));
	assign HEX1[5] = ~((~c1 & ~d1) | (b1 & ~c1) | (b1 & ~d1) | a1);
	assign HEX1[6] = ~((~b1 & c1) | (b1 & ~c1) | a1 |(b1 & ~d1));

endmodule
