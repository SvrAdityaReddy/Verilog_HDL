// A boolean function to return 1 when majority of bits are equal to 1, return 0 otherwise
// 4 bit majority function
primitive four_bit_majority_function(e,a,b,c,d);
    output e;
    input a,b,c,d;
    table
  //    a    b    c    d    :    e
	0   0   0   0   :   0;
	0   0   0   1   :   0;
	0   0   1   0   :   0;
	0   0   1   1   :   0;
	0   1   0   0   :   0;
	0   1   0   1   :   0;
	0   1   1   0   :   0;
	0   1   1   1   :   1;
	1   0   0   0   :   0;
	1   0   0   1   :   0;
	1   0   1   0   :   0;
	1   0   1   1   :   1;
	1   1   0   0   :   0;
	1   1   0   1   :   1;
	1   1   1   0   :   1;
	1   1   1   1   :   1;
    endtable
endprimitive

module fourbit(e,a,b,c,d);
    output e;
    input a,b,c,d;
    four_bit_majority_function g(e,a,b,c,d);
endmodule

module test_four_bit_function();
    wire e;
    reg a,b,c,d;
    fourbit G(e,a,b,c,d);
    initial
        begin
	    a=0;b=0;c=0;d=0;
	#50 a=0;b=0;c=0;d=1;
	#50 a=0;b=0;c=1;d=0;
	#50 a=0;b=0;c=1;d=1;
	#50 a=0;b=1;c=0;d=0;
	#50 a=0;b=1;c=0;d=1;
	#50 a=0;b=1;c=1;d=0;
	#50 a=0;b=1;c=1;d=1;
	#50 a=1;b=0;c=0;d=0;
	#50 a=1;b=0;c=0;d=1;
	#50 a=1;b=0;c=1;d=0;
	#50 a=1;b=0;c=1;d=1;
	#50 a=1;b=1;c=0;d=0;
	#50 a=1;b=1;c=0;d=1;
	#50 a=1;b=1;c=1;d=0;
	#50 a=1;b=1;c=1;d=1;
	end
endmodule
