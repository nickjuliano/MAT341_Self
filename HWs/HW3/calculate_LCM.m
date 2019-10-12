function lcm_val = calculate_LCM(x,y)

% Determines the least common multiple between two integers using a
% combination of for loops and if statements.
% 
% Takes two real numbers x,y as inputs.

    % First, check that both inputs are integers. If at least one is not an
    % integer, code does not execute.
    if (floor(x) == x && floor(y) == y)
        % Store mutliples of x and y in separate vectors, and define a
        % third vector to store common multiples.
        x_mults = [];
        y_mults = [];
        com_mults = [];
        
        % Loop to find multiples of integer x and populate x_mults. Note
        % that since the end goal is to determine the LCM of x and y, we
        % only need to check multiples up to the product x*y, since x*y is
        % always a common multiple of both integers.
        for i=1:y
            x_mults = [x_mults i*x];
        end
        
        % Similar loop to populate y_mults, where we find multiples of y up
        % to y*x.
        for i=1:x
            y_mults = [y_mults i*y];
        end
        
        % Check for common elements between the vectors x_mults and y_mults
        % by looping through each of them. Store each common multiple in
        % the vector com_mults.
        for i=1:length(x_mults)
            for j=1:length(y_mults)
                if x_mults(i) == y_mults(j)
                    com_mults = [com_mults x_mults(i)];
                end
            end
        end
        
        % Use the min() function to find the least number in the vector of
        % common multiples, in other words, find and return the LCM.
        lcm_val = min(com_mults);
        
    end


end