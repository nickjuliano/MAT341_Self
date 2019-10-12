%
%   Computes an approximation for pi using an infinite series + while loop
%   (no for loop = faster)
%

function pi_Approx1_faster(tol)
    err = 1;
    N = -1;  %initialized to -1 so pop into while loop begins with N=0
    val = 0;
    
    while err > tol
        N = N+1;
        
        val = val + 4*(-1)^N/(2*N+1);
        
        err = abs(val - pi);
    end
    N
end