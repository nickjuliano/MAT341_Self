function N = Gradient_Descent_1(tol,gamma)
    %   Implementation of the gradient descent algorithm to approximate
    %   minima of a two-variable function (whose gradient is defined at the
    %   bottom of the script).
    %
    %   Takes the desired error tolerance, tol, and fixed step size for each
    %   iteration, gamma, as input. Returns the number of iterations, N,
    %   required to achieve this desired error tolerance with the specified
    %   step size.
    
    x = [1; 1.5]; % Initial guess for the location of a minimum
    err = 1;
    N = 0;
    
    while err > tol
        x_temp = x; % Store the "old" vector x before iterating
        x = x - gamma*gradf(x); % The "new" vector x is the old vector 
        % minus the product of the step size and the gradient of f
        % (evaluated at the old vector x)
        err = sqrt((x-x_temp)'*(x-x_temp)); % Define error to be the l^2 
        % norm of the difference between the new and old x vectors

        N = N + 1;
    end

end

%   Note that the function being minimized is: f(x,y) = -(sin(x) + cos(y)) 
%   Gradient of function to minimize:
function val = gradf(x)
    val = [-cos(x(1)); sin(x(2))];
end

%   Using the initial point (1,1.5), it takes 35 iterations to achieve
%   1e-10 accuracy with step size 0.5.
%   
%   Using the same initial point, it takes 12 iterations to achieve 1e-10
%   accuracy with step size 0.9.
%
%   Using the same initial point, it takes 34 iterations to achieve 1e-10
%   accuracy with step size 1.5.