function perform_Nonlinear_Least_Squares()
    %  Implementation of a least squares algorithm to fit an nonlinear
    %  parametric function to a set of data points. This script calls the
    %  script "give_Nonlinear_Least_Squares_Data.m" to generate data.
    %
    %  Takes no input arguments returns nothing. Plots the fitted model
    %  function against the data points.

    % Generate N data points. Their distribution is determined by the
    % aforementioned script.
    N = 2500;
    data = give_NonLinear_Least_Squares_Data(N);
    
    % Initial guess for beta vector. Since our model function depends
    % nonlinearly on beta, there is no closed form solution for beta as in
    % the linear case, so we must approximate an optimal beta iteratively.
    beta = [1; 0.5; 0.3];
    
    % Error tolerance which determines when a beta vector sufficiently
    % minimizes the square of the l^2 norm of the residual.
    tol = 1e-5;
    
    err = 1;
    % dyVec is a vector whose components equal the difference between each 
    % of our y data values and the corresponding value of our model
    % function for a given approximation of beta. We use this to calculate
    % the step size in our beta approximation after each iteration.
    dyVec = [];
    % J is the Jacobian matrix for our model function, evaluated at each
    % each x data value and with the current approximation for beta.
    % Derivatives of the function are taken with respect to each component
    % of the current beta vector.
    J = [];
    
    % Routine to approximate a beta vector that sufficiently minimizes the
    % square of the l^2 norm of the residual vector.
    while err > tol
        for i=1:N
            x = data(i,1);
            % Here we set up our model function. Note that "expy" is the
            % function except for a beta(1) coefficient in front.
            expy = exp(-(x - beta(2))^2 / (2*beta(3)^2));
            % Here we form the delta y vector, as discussed above.
            dyVec(i,1) = data(i,2) - expy*beta(1);
            % Here we form the Jacobian matrix. There are three rows
            % because beta has three components, and N columns for each of
            % the x data values.
            J(i,1) = expy;
            J(i,2) = beta(1) * ((x - beta(2)) / beta(3)^2)*expy;
            J(i,3) = beta(1) * ((x - beta(2))^2 / beta(3)^3)*expy;
        end
        
        % The delta beta vector is our correction to the current beta
        % vector. It parallels the linear least squares method in that
        % dbVec is the solution to the linear equation dyVec = J*dbVec.
        dbVec = inv(J'*J)*J'*dyVec;
        
        % Storing the current beta approximation
        beta_temp = beta;
        % Calculating a better approximation for beta, using dbVec
        beta = beta + dbVec;
        
        % Define error to be the square of the l^2 norm of the difference
        % between the updated and "old" beta vectors.
        err = dot((beta - beta_temp),(beta - beta_temp));
        
    end
    
    % Residual vector, whose components we define as the difference between
    % each of our y data values and the corresponding model function 
    % values: r_i = y_i - f(x_i). We use the beta approximation found above
    % in our model function.
    rVec = [];
    for i=1:N
        rVec(i) = data(i,2) - beta(1)*exp(-((data(i,1) - beta(2))^2)/(2*beta(3)^2));
    end
    
    % l^2 norm of the residual vector
    L2_norm = sqrt(rVec'*rVec);
    
    % Evaluate our model function at each x value in the data set, storing
    % the function values in a vector.
    fVec = [];
    for i=1:N
        fVec(i) = beta(1)*exp(-((data(i,1) - beta(2))^2)/(2*beta(3)^2));
    end
    
    % Plot of data set against our fitted model function.
    figure();
    plot(data(:,1), data(:,2),'b.','MarkerSize',20,'LineWidth', 6);
    hold on;
    plot(data(:,1), fVec,'r','LineWidth', 4);
    xlabel('x');
    ylabel('y');
    legend('Data','Model Fit');

end