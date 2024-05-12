package floatingpoint;

localparam INT_BITS = 32; 
localparam EXPONENT_BITS = 8;
localparam FRACTION_BITS = 23;

typedef
  struct packed {
    bit sign;	
    bit [EXPONENT_BITS-1:0] exponent;
    bit [FRACTION_BITS-1:0] fraction;
  } float;


// FloatToShortreal

function automatic shortreal floattoshortreal(input float f);
return($bitstoshortreal(f));
endfunction: floattoshortreal


// ShortrealToFloat

function automatic float shortrealtofloat(input shortreal sr);
return($shortrealtobits(sr));
endfunction: shortrealtofloat


// DisplayFloatComponents

function automatic void displayfloatcomponents(float f);
$display("sign: %1b exponent: %2h fraction: %h\n",f.sign, f.exponent, f.fraction);
endfunction: displayfloatcomponents


// IsZero

function automatic bit iszero(float f);
return((f.exponent === '0) && (f.fraction === '0));
endfunction: iszero


// IsDenorm

function automatic bit isdenorm(float f);
return((f.exponent === '0) && (f.fraction !== '0));
endfunction: isdenorm


// IsNaN

function automatic bit isnan(float f);
return((f.exponent === '1) && f.fraction !== '0);
endfunction: isnan


// IsInf

function automatic bit isinfinity(float f);
return((f.exponent === '1) && (f.fraction === '0));
endfunction: isinfinity


endpackage
