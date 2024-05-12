
import floatingpoint::*;

module top();

float inf;
float nan;
float f;
float zero;
float denorm;

initial
begin

    // Zero
    zero.sign = 1'b0;
    zero.exponent = 8'b00000000;
    zero.fraction = 23'b00000000000000000000000;
    displayfloatcomponents(zero);

    // Denorm
    denorm.sign = 1'b1;
    denorm.exponent = 8'b00000000;
    denorm.fraction = 23'b00000000000000000000001;
    displayfloatcomponents(denorm);
    
    // NaN
    nan.sign = 1'b0;
    nan.exponent = 8'b11111111;
    nan.fraction = 23'b10000000000000000000000;
    displayfloatcomponents(nan);
    
    // inf
    inf.sign = 1'b1;
    inf.exponent = 8'b11111111;
    inf.fraction = 23'b00000000000000000000000;
    displayfloatcomponents(inf);

	f.sign = 1'b1;
	f.exponent = 8'b00110000;
	f.fraction = 23'b00000000000000000001000;
	displayfloatcomponents(f);
	$display("%f",floattoshortreal(f));
	$display("%f",shortrealtofloat($bitstoshortreal(32'h00000020)));

end
endmodule