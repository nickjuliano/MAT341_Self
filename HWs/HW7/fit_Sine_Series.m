function fit_Sine_Series
    %  Implementation of a linear least squares algorithm to fit an Mth
    %  order Fourier sine series to a set of data points.
    %
    %  Takes no input arguments returns nothing. Plots the fitted model
    %  function against the data points.
    
    % Generating data points:
    N=500;
    xData=linspace(-pi,pi,N);
    yData=( (0.25*xData.^2).* cos(xData).^4.* sin(xData).^7 )';

    % Creating the A matrix for our model function, a Fourier sine series
    % of order M.
    M = 40;
    for i=1:N
        for j=1:M
            A(i,j) = sin(j*xData(i));
        end
    end
    
    % Solving the linear equation y = A*beta for beta.
    beta = inv(A'*A)*A'*yData;
    
    % Residual vector, whose components we define as the difference between
    % each of our y data values and the corresponding model function 
    % values: r_i = y_i - f(x_i).
    rVec = yData - A*beta;
    
    % l^2-norm of residual vector, our measure for error
    L2_norm = sqrt(rVec'*rVec)
    
    % Define our model function using the beta we have found. We are
    % implicitly evaluating it at each of the x data values in this
    % definition (given the elements of A).
    fVec = A*beta;
    
    % Plot of data set against our fitted model function.
    figure();
    plot(xData,yData,'b','LineWidth',6);
    hold on;
    plot(xData,fVec,'r','LineWidth',4);
    xlabel('x')
    ylabel('y')
    legend('Data','Best Sine Series Fit')

end

%   Let N = 500 be the fixed number of data points that we are given. When
%   M (the number of terms in the sine series) equals 5, the l^2 norm of
%   the residual is 0.08132. When M = 10, l^2 norm = 0.00962. When M = 20,
%   l^2 norm = 2.14120e-06. When M = 40, l^2 norm = 3.91987e-09. Thus we
%   see that increasing the number of terms in our model function continues
%   to dramatically reduce the l^2 norm of the residual, even up to M = 40
%   terms.
%
%   This is a Fourier sine series approximation! :)
%