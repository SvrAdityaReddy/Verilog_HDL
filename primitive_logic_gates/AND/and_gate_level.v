module and_gate_level(c,a,b);
    output c;
    input a,b;
    and G1(c,a,b);
endmodule

// testbench for and gate

module test_and_gate_level();
    wire c;
    reg a,b;
    and_gate_level g(c,a,b);
    initial
 	begin
	    a=0;b=0;
	    #100 a=1;b=0;
	    #100 a=0;b=1;
	    #100 a=1;b=1;
	end
endmodule
