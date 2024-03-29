function N = successive_Parabolic_Interpolation(tol)
    %  Parabolic interpolation scheme for finding minima of a function. 
    %
    %  Takes 1 input, "tol", the desired error tolerance for the calculated
    %  minimum of the function. Returns the number of iterations required
    %  to achieve this error tolerance.
    %
    %  Given initial points x_1 = 0, x_2 = 0.6, x_3 = 0.9, this algorithm
    %  takes 227 iterations to achieve 1e-8 accuracy.
    %  If we change x_3 to x_3 = 2, then it takes 29 iterations to achieve
    %  1e-8 accuracy. In both instances, MATLAB issues a warning the the
    %  matrix A (which we are trying to invert) is nearly singular. After
    %  many iterations, x_1, x_2, and x_3 get very close to each other.
    %  This means that the rows of A are very nearly equal, so det(A) is
    %  almost zero.
    
    %  We "guess" a parabola that passes through the function values 
    %  evaluated at the points x_1, x_2, x_3.
    x_1 = 0;
    x_2 = 0.6;
    x_3 = 1.2;
    err = 1;

    N = 0;
    
    while err > tol
        %  We solve the matrix equation Ax = b for x to find the
        %  coefficients for the unique parabola that passes through the 
        %  function values at the three chosen points. Note that x is the 
        %  vector of three coefficients, and A is a matrix of parabola 
        %  equations (without coefficients) with x_1, x_2, and x_3 
        %  substituted in. b is a vector of the function value points that 
        %  we wish to pass the parabola through.
        A = [x_1^2 x_1 1; x_2^2 x_2 1; x_3^2 x_3 1];
        coeffs = inv(A)*[f(x_1); f(x_2); f(x_3)];
        
        %  Calculate the minimum value (or vertex) of our parabola: -b/2a
        x_min = - coeffs(2)/(2*coeffs(1));
        
        %  Relabel the points which define the parabola. We include the
        %  vertex of the previous parabola as one of the points, and cycle
        %  the other two.
        x_3 = x_2;
        x_2 = x_1;
        x_1 = x_min;
        
        %  The vertex of each successive parabola is closer to the actual
        %  minimum of the function. After a sufficient number of
        %  iterations, we expect that the three points on the parabola get
        %  arbitrarily close to the minimum (and each other). We therefore
        %  define error as the distance between the points x_3 and x_1.
        err = abs(x_3 - x_1);
        
        N = N + 1;
        
    end

end

    %  Function to minimize
function val = f(x)
    val = 0.5 - x * exp(-x^2);
end