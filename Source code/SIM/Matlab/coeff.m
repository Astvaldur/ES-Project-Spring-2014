
function [a] = coeff(b)

n = length(b);

q = [];

for i=1:n
    neg=0;
    a = b(i); % your float point number
    if(a<0)
       a=-a;
       neg=1;
    end
    
    ni = 1;         % number bits for integer part of your number      
    mi = 15;         % number bits for fraction part of your number
    
    % binary number
    d2b = fix(rem(a*pow2(-(ni-1):mi),2));
     
    g=num2str(d2b);
    nn = length(g);
    y=1;
    for k=1:nn
        if(g(k)=='1' | g(k)=='0')
            c(y)=g(k);
            y=y+1;
        end
    end
   
    if(neg==1)
        for k=1:16
            if(c(k)=='1')
                c(k)='0';
            else
                c(k)='1';
            end
        end
    end
        
       
q=[q,'"',c,'"',', '];          
    
end

a=q;


end
