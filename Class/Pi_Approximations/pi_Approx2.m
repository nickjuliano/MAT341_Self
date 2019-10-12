%
%   Computes an approximation for pi using an infinite series
%

function val = pi_Approx2(N)
    val = 0;

    for n=0:N
        val = val + (-1)^n/(2*n+1) * (1/sqrt(3))^(2*n+1);
    end
    val = 6*val;

    if abs(val - pi) < 10^(-12)
        N
        abs(val - pi)
    else
        pi_Approx2(N+1);

end