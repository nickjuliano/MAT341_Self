function prob = quad_Roots(N,L)
    
    count = 0;
    
    for j=1:N
       c1 = 2*L*rand() - L;
       c2 = 2*L*rand() - L;
       c3 = 2*L*rand() - L;
       c = [c1 c2 c3];
       
       r = roots(c);
       i = imag(r);
       
       if(max(abs(i))) == 0
           count = count + 1;
       end
    end
    
    prob = count/N;
       
end
