function calculate_Pi_Sums()

% Determines how many terms of a series are required to approximate the
% value of pi to within a specified tolerance. Also prints the resulting
% sequence of terms.

    tol = 1e-6; % Arbitrary tolerance
    err = 1;
    k = 0;

    a_n = 0;

    % Loop which continues adding terms in the series a_n until the error of 
    % the approximation falls below the tolerance
    while err > tol
        a_n = a_n + 6/sqrt(3) * (-1)^k /(3^k * (2*k + 1))

        k = k + 1;
        err = abs(a_n - pi);
    end

    N_A = k - 1 % Since we start at k = 0, the index of the final term is one
                % less than the number of required terms

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Similar logic applied to the series b_n

    tol = 1e-6;
    err = 1;
    k = 0;

    b_n = 0;

    while err > tol
        b_n = b_n + 16 * (-1)^k / (5^(2*k + 1)*(2*k + 1)) - 4 * (-1)^k / (239^(2*k + 1)*(2*k + 1))

        k = k + 1;
        err = abs(b_n - pi);
    end

    N_B = k - 1
    
end