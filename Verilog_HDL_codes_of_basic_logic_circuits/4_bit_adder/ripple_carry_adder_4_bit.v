// 4 bit ripple carry adder gate level
// http://fullchipdesign.com/fulladder.htm
// http://fullchipdesign.com/4_bit_binary_adder.htm

module half_adder(S,C,x,y);
    output S,C;
    input x,y;
    xor G1(S,x,y);
    and(C,x,y);    
endmodule

module full_adder(S,C,x,y,z);
    output S,C;
    input x,y,z;
    wire S1,C1,C2;
    half_adder G2(S1,C1,x,y);
    half_adder G3(S,C2,S1,z);
    or G4(C,C1,C2);
endmodule


module ripple_carry_adder_4_bit(S,C_out,A,B,C_in);
    output [3:0] S;
    output C_out;
    input [3:0] A;
    input [3:0] B;
    input C_in;
    wire C1,C2,C3;
    full_adder G5(S[0],C1,A[0],B[0],C_in);
    full_adder G6(S[1],C2,A[1],B[1],C1);
    full_adder G7(S[2],C3,A[2],B[2],C2);
    full_adder G8(S[3],C_out,A[3],B[3],C3);
endmodule

// test bench code

module test_ripple_carry_adder_4_bit();
    wire [3:0] S;
    wire C_out;
    reg [3:0] A;
    reg [3:0] B;
    reg C_in;
    ripple_carry_adder_4_bit G9(S,C_out,A,B,C_in);
    initial
	begin
	    A=4'b0111;B=4'b1110;C_in=0;
	    #100 A=4'b0001;B=4'b0010;C_in=0;
	end
endmodule
