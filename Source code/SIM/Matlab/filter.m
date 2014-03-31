%coeffs = fir1(23,14/60);

coeffs = fir1(3, 0.3/44.1);

i = 1;

for x = coeffs
   i;
   tmp = x*4096;
   if x >= 0
        %disp(tmp)
        %fprintf('=')
        fprintf('"')
        disp(dec2bin(tmp, 12));
        fprintf('"')
        
   else
      
      %disp(tmp)
      %fprintf('=')
      %disp(dec2bin(-tmp, 12));
      fprintf('"')
      %disp(dec2bin(-tmp, 12))
      disp(dec2bin(2^12+(tmp+1), 12))
      fprintf('"') 

      
   end
   
   fprintf(',')
   
   i = i + 1;
end