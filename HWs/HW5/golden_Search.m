function N = golden_Search(tol)
    %  Golden search algorithm for finding the x value (x_min) at which the
    %  global minimum of a single-valued, unimodal function occurs.
    %
    %  Takes 1 input, "tol", the desired error tolerance for the calculated
    %  value of x_min. Returns number of iterations to meet this tolerance.
    %
    %  This algorithm takes 40 iterations to achieve 1e-8 accuracy.
    
    %  We search for x_min with the interval [a,b]
    a = 0;
    b = 2;
    err = 1;
    N = 0;
    
    while err > tol
        T = (sqrt(5) - 1)/2;
        %  For each loop, define "guesses" x_1 and x_2 according to the
        %  current values of a,b with search step equal to the golden ratio
        x_1 = a + (1 - T)*(b - a);
        x_2 = a + T*(b - a);
        
        %  Since we are working with a unimodal function f, the relative
        %  values of f(x_1) and f(x_2) determine where x_min is located
        %  with respect to x_1 and x_2.
        %
        %  If f(x_1) > f(x_2), the minimum cannot be located to the left of
        %  x_1 (since x_1 is the leftmost point of x_1, x_2), since all x
        %  values in that region have function values f(x) which are
        %  greater than f(x_1). Therefore, we reduce our search interval by
        %  setting the lower bound equal to x_1.
        if f(x_1) > f(x_2)
            a = x_1;
        %  If f(x_2) >= f(x_1), we remove all point to the right of x_2 from
        %  consideration by setting the upper bound of our search interval
        %  equal to x_2.
        elseif f(x_2) >= f(x_1)
            b = x_2;
        end
        
        %  Notice that a and b approach each other as more iterations are
        %  carried out. We expect them to "meet" at the true global minimum
        %  (assuming we could step through an infinite number of
        %  iterations). Therefore, we define error as the distance between
        %  the lower and upper bounds, a and b.
        err = b - a;
        N = N + 1;
    end

end

%  Unimodal function to minimize
function val = f(x)
    val = 0.5 - x*exp(-x^2);
end