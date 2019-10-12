
function Sum_comp()
    n = 1;
    tol = 1e-2;
    err = 1;
    
    while err > tol
        a = 0;
        b = 0;
        
        n = n+1;
        for j=1:(n-1)^2
            b = b + (n-1)/((n-1)^2 + j^2);
        end
        
        for j=1:n^2
            a = a + n/(n^2 + j^2);
        end
        
        err = abs(a-b);
    end

    n
end