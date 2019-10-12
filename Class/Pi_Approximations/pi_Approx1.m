%
%   Computes an approximation for pi using an infinite series + while loop
%

function pi_Approx1(tol)
    err = 1;
    N = -1;  %initialized to -1 so pop into while loop begins with N=0
    
    while err > tol
        val = 0;
        N = N+1;
        for n=0:N
            val = val + 4*(-1)^n/(2*n+1);
        end
        err = abs(val - pi);
    end
    N
end