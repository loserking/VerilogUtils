module SIPO #(parameter BIT = 8, NDATA = 3)
(
	input i_clk,
	input i_shift,
	input [BIT-1:0] i_data,
	output [BIT-1:0] o_data [0:NDATA-1]
);
	integer i;

	reg [BIT-1:0] data_buf_r [0:NDATA-1];
	reg [BIT-1:0] data_buf_w [0:NDATA-1];

	assign o_data = data_buf_r;

	always@(*) begin
		if (i_shift) begin
			for (i = 0; i < NDATA-1; i=i+1) begin
				data_buf_w[i] = data_buf_r[i+1];
			end
			data_buf_w[NDATA-1] = i_data;
		end else begin
			for (i = 0; i < NDATA; i=i+1) begin
				data_buf_w[i] = data_buf_r[i];
			end
		end
	end

	always@(posedge i_clk) begin
		for (i = 0; i < NDATA; i=i+1) begin
			data_buf_r[i] <= data_buf_w[i];
		end
	end
endmodule
