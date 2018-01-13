module and_combinational_logic_model(c,a,b);
    output c;
    input a,b;
    assign c = (a&&b);
endmodule

// test bench code

module test_and_combinational_logic_model();
    wire c;
    reg a,b;
    and_combinational_logic_model g(c,a,b);
    initial
	begin
	    a=0;b=0;
	    #100 a=0;b=1;
	    #100 a=1;b=0;
	    #100 a=1;b=1;
	end		
endmodule
