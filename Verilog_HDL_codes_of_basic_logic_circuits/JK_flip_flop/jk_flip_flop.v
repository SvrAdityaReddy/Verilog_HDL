// jk flipflop

module JK_flip_flop(output reg Q, Q_b, input J, K, clk);
	always @(posedge clk)
		case({J,K})
			2'b00: begin Q<=Q; Q_b<=Q_b; end
			2'b01: begin Q<=0; Q_b<=1; end
			2'b10: begin Q<=1; Q_b<=0; end
			2'b11: begin Q<=!Q; Q_b<=!Q_b; end
		endcase
endmodule

// test bench code

module test_JK_flip_flop();
	wire Q,Q_b;
	reg J,K,clk;
	JK_flip_flop G(Q,Q_b,J,K,clk);
	initial
		begin
		J=0;K=1;clk=0;
		#100 clk=1;
		#100 clk=0;J=0;K=0;
       	        #100 J=1;K=1;
		#100 clk=1;J=1;K=0;
		#100 clk=0;
		#100 J=1;K=1;
		#100 clk=1;
		#100 clk=1;J=0;K=1;
		#100 clk=1;J=1;K=1;
	end
endmodule