// 64 bit x * 8 bit memory
// number of locations in ram are 64 so 6 bits are required

module memory_design(output reg [7:0] data_output, input [7:0] data_input, input [5:0] address, input enable, read_write, clk);
	reg [5:0] memory[63:0];
	always @(posedge clk)
		begin
			if (enable) 
				begin
					if (read_write)
						memory[address] <= data_input;
					else 
						data_output <= memory[address];
				end
		end
endmodule

module test_memory_design();
	wire [7:0] data_output;
	reg [7:0] data_input; 
	reg [5:0] address; 
	reg enable, read_write, clk;
	memory_design G(data_output, data_input, address, enable, read_write, clk);
	initial
		begin
			enable=1;read_write=1;clk=0;
			#100 clk=1;address=5'b00001;data_input=8'b00000010;
			#100 clk=0;
			#100 clk=1;read_write=0;address=5'b00001;
			#100 clk=0;read_write=1;address=5'b00010;data_input=8'b00000011;
			#100 clk=1;
			#100 clk=0;
			#100 clk=1;read_write=0;address=5'b00010;
		end
endmodule
