function prob = general_Roots(N, deg)
    
    count = 0;
    L = 1;
    for j=1:N
       c = [];
       for k=1:deg+1
           c(k) = 2*L*rand() - L;
       end
       r = roots(c);
       i = imag(r);
       
       if(max(abs(i))) == 0
           count = count + 1;
       end
    end
    
    prob = count/N;
       
end