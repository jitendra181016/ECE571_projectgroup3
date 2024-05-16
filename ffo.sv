
module FO4(input logic [3:0] b, output logic v, [1:0]p);
assign v = | b ;
assign p[1] = b[3] | b[2];		
assign p[0] = b[3] | ~b[2] & b[1];
endmodule


module FO8(input logic  v0, v1, [1:0] p0, p1, output logic v, [2:0]p);
assign v = v0 | v1;
assign p = v0 ? {v0, p0} : {v0, p1};
endmodule


module FO16(input logic v0, v1, [2:0] p0, p1, output logic v, [3:0]p);
assign v = v0 | v1;
assign p = v0 ? {v0, p0} : {v0, p1};
endmodule


module FO32(input logic v0, v1, [3:0] p0, p1, output logic v, [4:0]p);
assign v = v0 | v1;
assign p = v0 ? {v0, p0} : {v0, p1};
endmodule



module FFO32(input logic [31:0] b, output logic v, output logic [4:0] p);


wire [7:0][1:0] p1;
wire [7:0] v1;
generate
genvar i1;
for (i1 = 8; i1 > 0; i1--)
	FO4 F1 (b[(i1*4-1)-:4], v1[i1-1], p1[i1-1]);
endgenerate


wire [3:0][2:0] p2;
wire [3:0] v2;
generate
genvar i2;
for (i2 = 4; i2 > 0; i2--)
	FO8 F2 (v1[i2*2-1], v1[i2*2-2], p1[i2*2-1], p1[i2*2-2], v2[i2-1], p2[i2-1]);
endgenerate


wire [1:0][3:0] p3;
wire [1:0] v3;
generate
genvar i3;
for (i3 = 2; i3 > 0; i3--)
	FO16 F3 (v2[i3*2-1], v2[i3*2-2], p2[i3*2-1], p2[i3*2-2], v3[i3-1], p3[i3-1]);
endgenerate


FO32 F4 (v3[1], v3[0], p3[1], p3[0], v, p);
endmodule