function vary_Error_Tolerances_To_Compare()
    %  Plot number of iterations versus error tolerance for both the golden
    %  search and successive parabolic interpolation algorithms, for
    %  several different tolerances over many orders of magnitude.
    %
    %  This script calls the scripts "golden_Search" and
    %  "successive_Parabolic_Interpolation".
    %
    %  For less accurate tolerances (< 1e-7), the parabolic interpolation
    %  scheme appears to converge to the function's minimum faster (in 
    %  fewer iterations). For stricter tolerances (> 1e-8), the parabolic
    %  interpolation scheme converges slower than the golden search
    %  algorithm. As tolerance decreases, the parabolic scheme takes a
    %  dramatically greater number of iterations to converge. Meanwhile, the
    %  golden search algorithm converges at similar (though slightly
    %  slower) rates as tolerance decreases.
    %
    %  The slower convergence rate for the parabolic interpolation scheme
    %  is likely due to the singular matrix issue that crops up when x_1,
    %  x_2, and x_3 get very close. If we impose a sufficiently small
    %  tolerance, the three points eventually get near enough to each other
    %  that the matrix A (which we must invert) is very nearly singular.
    %  This impacts the accuracy of the parabola fitting step of the code,
    %  and so we require many iterations to fit a parabola which meets that
    %  tolerance.
    
    %  Create a vector of the error tolerances to compute N (number of iterations) for.
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
    golden_Its = [];
    parabola_Its = [];
    
    %  Calculate N for both algorithms, for each tolerance in errTolVec
    for i = 1:length(errTolVec)
        golden_Its = [golden_Its golden_Search(errTolVec(i))];
        parabola_Its = [parabola_Its successive_Parabolic_Interpolation(errTolVec(i))];
    end

    %  Semilog plot of N v. tol (both algorithms)
    figure(1);
    semilogx(errTolVec, golden_Its, 'b', errTolVec, parabola_Its, 'r', 'LineWidth', 5)
    xlabel('Error Tolerance')
    ylabel('Number of Iterations')
    legend('Golden Search','Parabolic Interpolation')
    
    %  LogLog plot of N v. tol (both algorithms)
    figure(2);
    loglog(errTolVec, golden_Its, 'b', errTolVec, parabola_Its, 'r', 'LineWidth', 5)
    xlabel('Error Tolerance')
    ylabel('Number of Iterations')
    legend('Golden Search','Parabolic Interpolation')
end