module top_test;

reg [31:0] b;
wire v;
wire [4:0] p;

FFO32 DUT (b, v, p);	

initial 
begin

b = '1;
for (int i = 0; i <= 32; i++)
	begin
	#100;
	$display("b = %b,	v = %b,   p = %d",b,v,p);
	b = (b >> 1);
	end
end
endmodule