//3:8 decoder with enable pin when enable pin is zero all output pins are zero
//https://www.electronicshub.org/binary-decoder/

module decoder_3_to_8(D,x,y,z,enable);
    output [0:7] D;
    input x,y,z,enable;
    wire not_x,not_y,not_z;
    not G1(not_x,x);
    not G2(not_y,y);
    not G3(not_z,z);
    and G4(D[0],not_x,not_y,not_z,enable);
    and G5(D[1],not_x,not_y,z,enable);
    and	G6(D[2],not_x,y,not_z,enable);
    and	G7(D[3],not_x,y,z,enable);
    and	G8(D[4],x,not_y,not_z,enable);
    and	G9(D[5],x,not_y,z,enable);
    and	G10(D[6],x,y,not_z,enable);
    and	G11(D[7],x,y,z,enable);
endmodule

module test_decoder_3_to_8();
    wire [0:7] D;
    reg x,y,z,enable;
    decoder_3_to_8 G(D,x,y,z,enable);
    initial
	begin
	    enable=1;x=0;y=0;z=0;
	    #50 enable=1;x=0;y=0;z=1;
       	    #50 enable=1;x=0;y=1;z=0;
	    #50 enable=1;x=0;y=1;z=1;
	    #50 enable=1;x=1;y=0;z=0;
	    #50 enable=1;x=1;y=0;z=1;
	    #50 enable=1;x=1;y=1;z=0;
	    #50 enable=1;x=1;y=1;z=1;
	end
endmodule
