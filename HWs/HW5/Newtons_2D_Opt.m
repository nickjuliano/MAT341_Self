function N = Newtons_2D_Opt(tol)
    %   Implementation of the Newton's method algorithm for approximating
    %   the minima of a two-variable function (defined at bottom of
    %   script). This code can also be generalized to approximate minima 
    %   for any multivariable function.
    %
    %   Takes the desired error tolerance, tol, as input. Returns the
    %   number of iterations required to achieve this tolerance.
    %
    
    x = [-0.25; 0.25]; % Initial guess for the location of a minimum, 
    % defined as a two-element column vector [x; y]
    err = 1;
    N = 0;
    
    while err > tol
        %  Define x_temp as the "previous" value of x before 
        %  assigning a new value to x.
        x_temp = x;
        %  Recursive loop for moving x closer to the location of a minimum.
        %  The step size is given by H^(-1) * gradf. If we compare to
        %  Newton's method in 1D, gradf is the multivariable analogue of f'
        %  and H is the multivariable analogue of f''. Notice that we
        %  multiply by the inverse of the matrix H since we cannot "divide"
        %  as we did with f'' in 1D. Also note that H^(-1) and gradf are
        %  evaluated at the previous x vector.
        x = x - inv(H(x))*gradf(x);
        %  Define error to be the l^2 - error between successive x vectors.
        err = sqrt(dot((x-x_temp),(x-x_temp)));
        N = N + 1;
    end

end

%   Function to minimize:
function val = f(x)
    val = -(sin(x(1)) + cos(x(2)));
end

%   Hessian (matrix of second derivatives) of function to minimize:
function val = H(x)
    val = [sin(x(1)) 0; 0 cos(x(2))];
end

%   Gradient of function to minimize:
function val = gradf(x)
    val = [-cos(x(1)); sin(x(2))];
end

%   With initial guess (x_1,y_1) = (-0.25, 0.25) and error tolerance 1e-8,
%   this algorithm takes 5 iterations to converge to the minimum f(x,y) =
%   -2 located at (-3pi/2, 0).
%
%   Changing the initial guess to (x_1, y_1) = (-4.5, 4.5), the algorithm
%   finds the same minimum located at (-3pi/2, 0). With this guess, it
%   takes only 4 iterations to achieve 1e-8 accuracy.
%