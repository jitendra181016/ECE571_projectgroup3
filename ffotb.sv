module top25;

reg [31:0] b;
wire v;
wire [4:0] p;

FFO25 DUT (b, v, p);	

initial 
begin

b = {{7{1'b0}}, {24{1'b1}}};
for (int i = 0; i <= 25; i++)
	begin
	#100;
	$display("b = %b,	v = %b,   p = %d",b,v,p);
	b = (b >> 1);
	end
end
endmodule