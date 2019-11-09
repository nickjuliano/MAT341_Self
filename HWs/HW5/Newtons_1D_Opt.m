function N = Newtons_1D_Opt(tol)
    %   Implementation of the Newton's method algorithm for approximating the
    %   minima of a single-variable function (defined at bottom of script).
    %
    %   Takes the desired error tolerance, tol, as input. Returns the
    %   number of iterations required to achieve this tolerance.
    %
    
    x = 0.25; %  Initial guess for location of minimum (choice of x_1 greatly influences results!)
    err = 1;
    N = 0;

    while err > tol
        % Define x_temp as the "previous" value of x before 
        % assigning a new value to x.
        x_temp = x;
        % Recursive loop for moving x closer to a minimum. We use
        % f'(x_n)/f''(x_n) as the step size for finding minima with
        % Newton's method.
        x = x - f_prime(x)/f_2prime(x);
        % Define error to be the difference between successive x values.
        err = abs(x_temp - x);
        N = N + 1;
    end

    x
end

%   Function to minimize:
function val = f(x)
    val = 0.5 - x*exp(-x^2);
end

%   First derivative of function to minimize:
function val = f_prime(x)
    val = -exp(-x^2)+2*x^2*exp(-x^2);
end

%   Second derivative of function to minimize:
function val = f_2prime(x)
    val = 2*x*exp(-x^2) + 4*x*exp(-x^2) - 4*x^3*exp(-x^2);
end

%   With initial guess x_1 = 0.25 and error tolerance 1e-8, this algorithm 
%   takes 6 iterations to find the minimum at approximately x = 0.707.
%
%   Changing the initial guess from x_1 = 0.25 to x_1 = 1.5, the script
%   exits the while loop after 736 iterations. However, the location of the
%   minimum is reported as NaN, so the script does not return the location
%   of the minimum as it did with a more "appropriate" initial guess. Upon
%   further inspection, my explanation is that the inflection point of f(x)
%   at around x = 1.2 causes the step size to practically "blow up" as x
%   values decrease near this point, which results in an ineffective next
%   guess for x_min. The algorithm must then spend many iterations
%   correcting future x values after this "bad guess".