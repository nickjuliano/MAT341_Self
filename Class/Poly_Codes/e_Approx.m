%
% Compute the nth partial sum of the Taylor series for e
%

function void = e_Approx(N)
    val = 0;
    
    for i=0:N
       val = val + 1/(factorial(i));
    end
    
    if abs(val - exp(1)) < 10^(-14)
        N
    else
        e_Approx(N+1)
end