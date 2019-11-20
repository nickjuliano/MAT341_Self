function vary_Error_Tolerances_To_Compare()
    %   Plot number of iterations versus error tolerance for two
    %   implementations of the gradient descent algorithm: one using a
    %   fixed step size ("Gradient_Descent_1") and the other using the
    %   Barzilai-Borwein step size ("Gradient_Descent_2"). The chosen error
    %   tolerances span many orders of magnitude.
    %
    %   This script calls the scripts "Gradient_Descent_1" and 
    %   "Gradient_Descent_2".
    %

    %  Create a vector of the error tolerances to compute N (number of iterations) for.
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];
    %   Step size to use for the fixed step version of the algorithm
    fixed_step = 0.5;
    %   Initialize N storage vectors for each algorithm
    gdFixed_Its = [];
    gdBB_Its = [];
    
    %   Calculate N for both algorithms, for each error tolerance in
    %   errTolVec
    for i = 1:length(errTolVec)
        gdFixed_Its = [gdFixed_Its Gradient_Descent_1(errTolVec(i),fixed_step)];
        gdBB_Its = [gdBB_Its Gradient_Descent_2(errTolVec(i))];
    end
    
    %  Semilog plot of N vs. tol (both algorithms)
    figure(1);
    semilogx(errTolVec, gdFixed_Its, 'b', errTolVec, gdBB_Its, 'r', 'LineWidth', 5)
    xlabel('Error Tolerance')
    ylabel('Number of Iterations')
    legend('Fixed Step','Barzilai-Borwein')
    
    %  LogLog plot of N vs. tol (both algorithms)
    figure(2);
    loglog(errTolVec, gdFixed_Its, 'b', errTolVec, gdBB_Its, 'r', 'LineWidth', 5)
    xlabel('Error Tolerance')
    ylabel('Number of Iterations')
    legend('Fixed Step','Barzilai-Borwein')

end

%   When we use the "best" step size for the fixed step algorithm (gamma =
%   1), the fixed step algorithm appears to converge faster than the
%   Barzilai-Borwein step size algorithm for all error tolerances.
%
%   When we use a fixed step size of gamma = 0.5, the Barzilai-Borwein
%   version of the algorithm is the fastest of the two for all tested error
%   tolerances. The number of iterations required by the fixed step version is
%   within two or three of the Barzilai-Borwein version for tol = 1e-1, but
%   gradually increases as tol is decreased, whereas the number required
%   by Barzilai-Borwein stays relatively stable (between 5 and 7 iterations)
%   as tol is decreased.
%
%   As mentioned, the Barzilai-Borwein step size is robust against changing
%   the initial guess for step size (while the results that we see from the
%   fixed step size algorithm are strongly dependent on this initial
%   guess). Further, the Barzilai-Borwein step size requires a fairly
%   constant number of iterations to converge even over error tolerances
%   spanning many orders of magnitude (this is at least true for the error
%   tolerances tested here, spanning 10 orders of magnitude). In this
%   example, the number of iterations required for the smallest and largest
%   error tolerances differ by only about 2 or 3.
%
%   If we were to change the function that we want to minimize, I would
%   choose the Barzilai-Borwein step size because (assuming we can calculate
%   it as we did here) it requires no additional function-dependent information
%   to guarantee quick convergence. The optimal step size that we used here
%   is not necessarily the optimal size for another function, so we would
%   first have to determine the new best choice of step size each time we
%   change the function to minimize. This is to assure that the algorithm
%   converges in a reasonable number of iterations, because as we saw here,
%   the choice of step size strongly determines the number of iterations
%   that the fixed step algorithm requires.