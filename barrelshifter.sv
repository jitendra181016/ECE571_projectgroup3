module BarrelShifter(In, ShiftAmount, ShiftIn, Out);
	parameter N = 16;
    input [N-1:0] In;
    input [$clog2(N)-1:0] ShiftAmount; 
    input ShiftIn;
    output reg [N-1:0] Out;

wire [N-1:0] shift[$clog2(N):0];

assign shift[$clog2(N)] = In;

genvar i;
generate
    for (i = ($clog2(N))-1 ; i >= 0 ; i=i-1) begin
        mux_2to1_Nbit #(N) mux (
            .in_0(shift[i+1]),
            .in_1(shift[i+1] << 2**i | {2**i{ShiftIn}}),
            .sel(ShiftAmount[i]),
            .out(shift[i])
        );
    end
endgenerate


assign Out = shift[0]; 

endmodule


module mux_2to1_Nbit (in_0, in_1, sel, out);
	parameter N = 16;
    input [N-1:0] in_0;
    input [N-1:0] in_1;
    input sel;
    output [N-1:0] out;

assign out = sel ? in_1 : in_0;

endmodule
