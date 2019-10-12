function is_It_Prime(N)
    
    %modular arithmetic
    %mod(4,2) = 4 mod 2
    
    %must check integers up to sqrt(N) to see if N is prime
   
    x = floor(sqrt(N));
    i = 2;
    is_Prime = 1;
    
    while i <= x
        if (mod(N,i) == 0)
            str = 'not prime'
            is_Prime = 0;
            break
        else
            i = i+1;
        end
    end
    if is_Prime == 1
        str = 'prime'
    end
end