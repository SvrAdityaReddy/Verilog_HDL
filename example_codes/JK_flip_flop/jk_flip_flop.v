// jk flipflop

module JK_flip_flop(output reg Q, Q_b, input J, K, clk);
	always @(posedge clk)
		case({J,K})
			{1'b0,1'b0}: begin Q<=Q; Q_b<=Q_b; end
			{1'b0,1'b1}: begin Q<=0; Q_b<=1; end
			{1'b1,1'b0}: begin Q<=1; Q_b<=0; end
			{1'b0,1'b1}: begin Q<=!Q; Q_b<=!Q; end
		endcase
endmodule

// test bench code

module test_JK_flip_flop();
	wire Q,Q_b;
	reg J,K,clk;
	JK_flip_flop G(Q,Q_b,JK,clk);
	initial
		begin
		clk=1;J=0;K=1;
		#100 clk=0;J=0;K=0;
	    #100 J=1;K=1;
		#100 J=0;K=1;
		#100 clk=1;J=1;K=0;
		#100 clk=0;
		#100 J=1;K=1;
		#100 clk=1;
		#100 clk=1;J=0;K=1;
		#100 clk=1;J=1;K=1;
	end
endmodule