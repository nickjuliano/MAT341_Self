function prob = pi_Approx_Darts(N)    
%  
%   Approximate the value of pi geometrically with a Monte Carlo approach,
%   by comparing the ratio of the areas of a circle and a square inscribing it.
%
    
    count = 0;
    for i=1:N
        x = rand()/2;
        y = rand()/2;
        r = sqrt(x^2 + y^2);
        
        if r <= 1/2
            count = count + 1;
        end
       
    end
    
    prob = 4 * count/N;
    err = abs(prob - pi)

end