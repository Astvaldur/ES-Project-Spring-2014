function [ output_args ] = fixed( x, bits )
%FIXED Converts float to fixed point representation
%   Detailed explanation goes here

    for n = 1:numel(x)
       tmp = x(n)*2^bits;
       x(n)
       if x(n) >= 0
           output_args(n) = bin2dec(dec2bin(tmp, bits)); 
           dec2bin(tmp, bits)
       else
           output_args(n) = bin2dec(dec2bin(2^bits+(tmp+1), bits));
           %dec2bin(2^bits+(tmp+1), bits)
           dec2bin(-tmp, bits)
       end
    end
end

