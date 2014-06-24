module MAC #(parameter ABIT = 8, BBIT = 8, EBIT = 8) /* # i_a, i_b bits and # extra bits for accumulator */
(
	// clock input
	i_clk,
	// value inputs
	i_a, i_b, i_loadVal,
	// control inputs
	i_load, i_add, i_useMul,
	// you know
	o_result
);
	// i_load/i_useMul/i_add: o_result
	//      0/       0/    x  o_result
	//      0/       1/       o_result+a*b (or minus)
	//      1/       0/    x  i_loadVal
	//      1/       1/       i_loadVal+a*b (or minus)
	localparam MBIT = ABIT+BBIT; // multiplication
	localparam TBIT = MBIT+EBIT; // total

	input i_clk, i_load, i_add, i_useMul;
	input signed [ABIT-1:0] i_a;
	input signed [BBIT-1:0] i_b;
	input signed [TBIT-1:0] i_loadVal;
	output reg signed [TBIT-1:0] o_result;

	// bit extension
	wire signed [MBIT-1:0] i_a_se = {{BBIT{i_a[ABIT-1]}}, i_a};

	wire signed [TBIT-1:0] prevVal = i_load? i_loadVal: o_result;
	wire signed [MBIT-1:0] mul_result = i_a_se * i_b;
	wire signed [TBIT-1:0] mac_result = i_add? (prevVal+mul_result): (prevVal-mul_result);

	always@(posedge i_clk) begin
		o_result <= i_useMul? mac_result: prevVal;
	end
endmodule
