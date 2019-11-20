function vary_StepSize_Gamma_To_Optimize()
    %   A test of the gradient descent algorithm to determine the fixed
    %   step size which achieves convergence to a minimum in the fewest 
    %   iterations. Plots the required number of iterations, N, at a fixed 
    %   error tolerance, tol, versus the step size used. Step sizes to test
    %   are stored in "gammaVec". Note that step sizes below 0.1 require
    %   several orders of magnitude more iterations to converge than step
    %   sizes in the range 0.1-1.9, so they do not make for suitable 
    %   "optimal" guesses (though one such step size is included for 
    %   comparison). Step sizes greater than or equal to 2 do not seem to 
    %   converge at all with tol = 1e-10, and if they do, the number of 
    %   iterations required are also many orders of magnitude greater than 
    %   step sizes in the range 0.1-1.9.
    %
    %   This script calls the script "Gradient_Descent_1". Note that this
    %   is where the function that we are minimizing and the initial guess
    %   are defined.
    %

    tol = 1e-10; % Fixed error tolerance
    gammaVec = [1e-2 0.1:0.1:1.9]; % Step sizes to compute N for
    gamma_Its = [];
    
    % Compute the required number of iterations for each step size in
    % gammaVec and store these values in a vector, "gamma_Its"
    for i=1:length(gammaVec)
        gamma_Its = [gamma_Its Gradient_Descent_1(tol,gammaVec(i))];
    end

    % Semilog plot of N vs. Gamma
    semilogx(gammaVec, gamma_Its, 'b', 'LineWidth', 5)
    xlabel('Step Size')
    ylabel('Number of Iterations for Convergence')
    legend('Fixed Step')
    
end

%   For f(x,y) = - (sin(x) + cos(y)), the optimal fixed step size appears
%   to be gamma = 1.