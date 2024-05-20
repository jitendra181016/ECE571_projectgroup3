
module FO4(input logic [3:0] b, output logic v, [1:0]p);
assign v = | b ;
assign p[1] = b[3] | b[2];		
assign p[0] = b[3] | ~b[2] & b[1];
endmodule


module FO8(input logic  v0, v1, [1:0] p0, p1, output logic v, [2:0]p);
assign v = v0 | v1;
assign p = v0 ? {v0, p0} : {v0, p1};
endmodule


module FO24(input logic v0, v1, v2, [2:0] p0, p1, p2, output logic v, [4:0]p);
assign v = v0 | v1 | v2;
assign p = v0 ? {v0,1'b0, p0} : v1 ? {v0,1'b1, p1} : {v0,1'b0, p2};
endmodule



module FFO24(input logic [23:0] b, output logic v, output logic [4:0] p);


wire [7:0][1:0] p1;
wire [7:0] v1;
generate
genvar i1;
for (i1 = 6; i1 > 0; i1--)
	FO4 F1 (b[(i1*4-1)-:4], v1[i1-1], p1[i1-1]);
endgenerate


wire [2:0][2:0] p2;
wire [2:0] v2;
generate
genvar i2;
for (i2 = 3; i2 > 0; i2--)
	FO8 F2 (v1[i2*2-1], v1[i2*2-2], p1[i2*2-1], p1[i2*2-2], v2[i2-1], p2[i2-1]);
endgenerate


FO24 F3 (v2[2], v2[1], v2[0], p2[2], p2[1], p2[0], v, p);
endmodule