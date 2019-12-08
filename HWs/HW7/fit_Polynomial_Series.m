function fit_Polynomial_Series()
    %  Implementation of a linear least squares algorithm to fit a twelfth
    %  degree polynomial to a set of data points with a (co)sinusoidal distribution.
    %
    %  Takes no input arguments returns nothing. Plots the fitted model
    %  function against the data points.
    
    % Generating data points:
    N=250;
    xData=linspace(-2*pi,2*pi,N);
    yData=cos(xData)';
    
    % Creating the A matrix for our model function, a polynomial of degree
    % 12.
    for i=1:N
        for j=1:13
            A(i,j) = xData(i)^(j-1);
        end
    end

    % Here we solve the linear equation y = A*beta for beta. Since A is not
    % generally square, we multiply both sides of this equation by the
    % pseudoinverse of A, (A'A)^{-1}*A', to isolate beta. We have shown
    % that this beta minimizes the l^2 norm of any model function linear in
    % beta.
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
    legend('Data','Best 12th Deg Poly Fit')
end

%   When N = 10, the l^2 norm of the residual is 1.7910; when N = 50, l^2
%   norm = 5.1501e-04, and when N = 250, l^2 norm = 0.0011. Increasing N
%   does not appear to decrease the l^2 norm monotonically. For low N, the
%   fit is relatively poor because there is simply insufficient data to
%   perform an optimal fit. However, past some threshold for N, increasing
%   the number of data points does not lead to further improvements in
%   the model function fit (Is this accurate? I would generally expect the
%   model fit to either improve or roughly level out as N is increased The
%   fit when N = 250 is certainly reasonable, but the l^2 norm at this N is
%   much larger than that of the N = 50 polynomial. Does this have to do 
%   with the fact that we are restricted to twelfth degree (as opposed to Nth),
%   so eventually more data does not imply a better prediction)?
%
%   Cos(x) can be expressed as a Taylor series, where the coefficients of 
%   the odd terms are zero and the coefficient of the nth even term 
%   (starting with n = 0) is given by (-1)^n / (2n)!.
%
%   When N = 250, the first four (again starting with n = 0) coefficients 
%   of even terms of the model polynomial are: 0.99991, -0.49977, 0.04156,
%   and -0.00137. All odd coefficients are very small relative to these
%   values, and coefficients of later even terms rapidly approach zero. The
%   sign of successive even coefficients alternates in all instances, and
%   the magntiude of each coefficient closes resembles the corresponding
%   coefficient in the cosine Taylor series (see above).
%