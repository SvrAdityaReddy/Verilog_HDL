// up counter 3 bit synchronous counter using D flip flops

// d flip flop

module D_flip_flop(output reg Q, input D, clk);
    always @(posedge clk)
	    Q <= D;
endmodule

// module incrementer(output [2:0] Q_b, input [2:0] Q);
//     wire I1,I2,I3;
//     and G1(Q[0],~Q[0],1);
//     xor G2(Q[1],Q[1],Q[0]);
//     or G3(I1,~Q[1],~Q[0]);
//     and G4(I2,Q[2],I1);
//     and G5(I3,~Q[2],Q[1],Q[0]);
//     or G6(Q[2],I2,I3);
// endmodule

module up_counter_3_bit(output [2:0] Q_b, input clk);
    wire I1,I2,I3,I4,I5;
    reg [2:0] Q;
    initial
        Q<=3'b000;
    D_flip_flop G1(Q_b[0],~Q[0],clk);
    xor G2(I1,Q[1],Q[0]);
    D_flip_flop G3(Q_b[1],I1,clk);
    or G4(I2,~Q[1],~Q[0]);
    and G5(I3,Q[2],I2);
    and G6(I4,~Q[2],Q[1],Q[0]);
    or G7(I5,I4,I3);
    D_flip_flop G8(Q_b[2],I5,clk);
    always @*
        Q=Q_b;
    // and G9(Q[0],Q_b[0],1);
    // and G10(Q[1],Q_b[1],1);
    // and G11(Q[2],Q_b[2],1);
endmodule

// test bench code

module test_up_counter_3_bit();
    wire [2:0] Q_b;
    // reg [2:0] Q;
    reg clk;
    up_counter_3_bit G(Q_b,clk);
    initial
        begin
            clk=0;
            #50 clk=1;
            #50 clk=0;
            #50 clk=1;
            #50 clk=0;
            #50 clk=1;
            #50 clk=0;
            #50 clk=1;
            #50 clk=0;
            #50 clk=1;
            #50 clk=0;
            #50 clk=1;
            #50 clk=0;
            #50 clk=1;
            #50 clk=0;
            #50 clk=1;
        end
endmodule