%
%   Computes an approximation for pi using an infinite series (this series
%   does not converge)
%

function val = pi_Approx3(N)
    val = 0;

    for n=0:N
        val = val + (-1)^n/(2*n+1) * (sqrt(3))^(2*n+1);
    end
    val = 3*val;

    if abs(val - pi) < 10^(-6)
        N
    %else
    %    pi_Approx(N+1)

end