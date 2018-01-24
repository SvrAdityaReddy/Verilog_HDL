// 4 bit serial shift register

// d flip flop

module D_flip_flop(output reg Q, input D, clk);
    initial
        Q=0;
    always @(posedge clk)
	    Q <= D;
endmodule

module shift_register(output [3:0] Q, input D, clk);
    D_flip_flop G1(Q[0],D,clk);
    D_flip_flop G2(Q[1],Q[0],clk);
    D_flip_flop G3(Q[2],Q[1],clk);
    D_flip_flop G4(Q[3],Q[2],clk);
endmodule 

// test bench code

module test_shift_register();
    wire [3:0] Q;
    reg D,clk;
    shift_register G(Q,D,clk);
    initial
        begin
           D=0;clk=0;
           #50;clk=1;D=1;
           #50;clk=0;
           #50;clk=1;D=0;
           #50;clk=0;
           #50;clk=1;D=1;
           #50;clk=0;
           #50;clk=1;D=0;
           #50;clk=0; 
           #50;clk=1;  
           #50;clk=0;
           #50;clk=1;
           #50;clk=0;
           #50;clk=1;
           #50;clk=0;
           #50;clk=1;
        end
endmodule
