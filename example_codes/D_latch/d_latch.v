// d latch

module D_latch(output reg Q,input enable,D);
    always @(enable,D)
	if(enable) Q <= D;
endmodule

// test bench code

module test_D_latch();
    wire Q;
    reg enable,D;
    D_latch G(Q,enable,D);
    initial
	begin
	    enable=1;D=0;
            #100 D=1;
	    #100 D=0;
	    #100 enable=0;D=1;
	    #100 enable=1;
	    #100 D=1;
	    #100 enable=0;
	    #100 enable=1;D=0;
	    #100 enable=1;D=1;
	end
endmodule
