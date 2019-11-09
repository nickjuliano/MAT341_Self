function vary_Error_Tolerances_To_Compare()
    %  Plot number of iterations versus error tolerance for three 1D 
    %  optimization algorithms: golden search, successive parabolic 
    %  interpolation, and Newton's method for several different tolerances
    %  spanning many orders of magnitude.
    %
    %  This script calls the scripts "golden_Search", 
    %  "successive_Parabolic_Interpolation", and "Newtons_1D_Opt".
    %
    
    %  Create a vector of the error tolerances to compute N (number of iterations) for.
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
    %  Initialize N storage vectors for each algorithm
    golden_Its = [];
    parabola_Its = [];
    Newton_Its = [];
    
    %  Calculate N for each algorithm, for each tolerance in errTolVec
    for i = 1:length(errTolVec)
        golden_Its = [golden_Its golden_Search(errTolVec(i))];
        parabola_Its = [parabola_Its successive_Parabolic_Interpolation(errTolVec(i))];
        Newton_Its = [Newton_Its Newtons_1D_Opt(errTolVec(i))];
    end

    %  Semilog plot of N v. tol (all three algorithms)
    figure(1);
    semilogx(errTolVec, golden_Its, 'b', errTolVec, parabola_Its, 'r', errTolVec, Newton_Its, 'k', 'LineWidth', 5)
    xlabel('Error Tolerance')
    ylabel('Number of Iterations')
    legend('Golden Search','Parabolic Interpolation', 'Newton''s Method')
    
    %  LogLog plot of N v. tol (all three algorithms)
    figure(2);
    loglog(errTolVec, golden_Its, 'b', errTolVec, parabola_Its, 'r', errTolVec, Newton_Its, 'k', 'LineWidth', 5)
    xlabel('Error Tolerance')
    ylabel('Number of Iterations')
    legend('Golden Search','Parabolic Interpolation', 'Newton''s Method')
    
end

%   For all but the largest error tolerances, Newton's method converges the
%   quickest out of these three algorithms. For tolerances larger than
%   1e-2, the number of iterations that it takes the parabolic
%   interpolation scheme and Newton's method to converge are roughly
%   equivalent.
%
%   As the desired accuracy is increased, the parabolic interpolation
%   scheme gradually takes more iterations to converge until tol = 1e-7, at
%   which point N increases dramatically for this algorithm. On the other
%   hand, Newton's method requires the same order of magnitude N 
%   (between 1 and 10) to converge for all error tolerances considered.
%   Newton's method remains the quickest as tol varies.
%
%   The initial guess(es) that we use for these algorithms could wildly
%   change their convergence rates relative to one another. As we have seen
%   while applying Newton's method to this very function, changing our
%   initial guess to x_1 = 1.5 increased N by two orders of magnitude at
%   tol = 1e-8. With all other parameters kept the same, this would make
%   Newton's method either the slowest or very nearly the slowest of the
%   three algorithms at this tolerance. We would see changes in the
%   convergenece rates of the golden search algorithm and parabolic
%   interpolation algorithm if we made similar changes to their initial
%   guesses.