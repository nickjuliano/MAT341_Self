function val = general_Poly(cVec,x)
    % cVec has a variable number of elements
    N = length(cVec);
    val = 0;
    
    for i=1:N
       val = val + cVec(i)*x^(i-1);
    end
    
end