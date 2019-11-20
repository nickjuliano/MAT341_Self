function N = Gradient_Descent_2(tol)
    %   Implementation of the gradient descent algorithm to approximate
    %   minima of a two-variable function (whose gradient is defined at the
    %   bottom of the script).
    %
    %   Takes the desired error tolerance, tol, as input. Returns the number
    %   of iterations, N, required to achieve this desired error tolerance 
    %   using the Barzilai-Borwein step size.

    x = [1; 1.5]; % Initial guess for the location of a minimum
    gamma = 0.5; % Initial step size
    err = 1;
    N = 0;
    
    while err > tol
        x_temp = x; % Store the "old" vector x before iterating
        x = x - gamma*gradf(x); % The "new" vector x is the old vector 
        % minus the product of the step size and the gradient of f
        % (evaluated at the old vector x)
        err = sqrt((x-x_temp)'*(x-x_temp)); % Define error to be the l^2 
        % norm of the difference between the new and old x vectors
        gamma = abs((x - x_temp)'*((gradf(x) - gradf(x_temp)))) / (dot(gradf(x) - gradf(x_temp),gradf(x) - gradf(x_temp)));
        
        N = N + 1;
    end
    
end

%   Note that the function being minimized is: f(x,y) = -(sin(x) + cos(y)) 
%   Gradient of function to minimize:
function val = gradf(x)
    val = [-cos(x(1)); sin(x(2))];
end

%   Using the initial point (1,1.5) and initial step size 0.5, it takes 6
%   iterations the achieve 1e-6 accuracy with the Barzilai-Borwein step
%   size.
%
%   Using the same initial point and step size, it takes 7 iterations to
%   achieve 1e-10 accuracy with the Barzilai-Borwein step size.