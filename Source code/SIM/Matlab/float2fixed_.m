function [ output_args ] = float2fixed_( x, bits )
%FLOAT2FIXED Converts float to fixed point representation
%   Detailed explanation goes here
   tmp = x*2^bits;
   if x >= 0
       output_args = bin2dec(dec2bin(tmp, bits)); 
   else
       output_args = bin2dec(dec2bin(2^bits+(tmp+1), bits));
   end
end

