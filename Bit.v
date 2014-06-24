module Cvt2DTo1D #(parameter NBIT = 8, CNT = 8) (
	input [NBIT-1:0] i [0:CNT-1],
	output reg [(NBIT*CNT-1):0] o
);
	always@(*) begin
		// i is used for the name...
		for (int j = 0; j < CNT; ++j) begin
			o[(NBIT*(CNT-j)-1) -: NBIT] = i[j];
		end
	end
endmodule

module Cvt1DTo2D #(parameter NBIT = 8, CNT = 8) (
	input [(NBIT*CNT-1):0] i,
	output reg [NBIT-1:0] o [0:CNT-1]
);
	always@(*) begin
		// i is used for the name...
		for (int j = 0; j < CNT; ++j) begin
			o[j] = i[(NBIT*(CNT-j)-1) -: NBIT];
		end
	end
endmodule

module Reshape #(parameter NBIT1 = 8, CNT1 = 8, NBIT2 = 8, CNT2 = 8) (
	input [NBIT1-1:0] i [0:CNT1-1],
	output [NBIT2-1:0] o [0:CNT2-1]
);
	// assert(NBIT1*CNT1==NBIT2*CNT2);
	wire [(NBIT1*CNT1-1):0] tmp;
	Cvt2DTo1D #(NBIT1, CNT1) cvt0(i, tmp);
	Cvt1DTo2D #(NBIT2, CNT2) cvt1(tmp, o);
endmodule

module US2S #(parameter NBIT = 8, CNT = 8) (
	input [NBIT-1:0] i [0:CNT-1],
	output reg signed [NBIT-1:0] o [0:CNT-1]
);
	always@(*) begin
		// i is used for the name...
		for (int j = 0; j < CNT; ++j) begin
			o[j] = i[j];
		end
	end
endmodule

module S2US #(parameter NBIT = 8, CNT = 8) (
	input signed [NBIT-1:0] i [0:CNT-1],
	output reg [NBIT-1:0] o [0:CNT-1]
);
	always@(*) begin
		// i is used for the name...
		for (int j = 0; j < CNT; ++j) begin
			o[j] = i[j];
		end
	end
endmodule

module Slice #(parameter IBIT = 8, START = 8, JMP = -1, END = 0) (i, o);
	localparam OBIT = 1+(END-START)/JMP;
	input [IBIT-1:0] i;
	output reg [OBIT-1:0] o;
	always@(*) begin
		// i is used for the name...
		for (int j = OBIT-1, k = START; j >= OBIT; --j, k += JMP) begin
			o[j] = i[k];
		end
	end
endmodule
