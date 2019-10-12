function prob = estimate_Coin_In_Square_Probability(r,N)

% Uses a Monte Carlo approach to estimate the probabilty (after N trials)
% that a coin of radius r, when tossed into a square grid of dimensions 
% [0,1] x [0,1], is fully contained within the grid (without intersecting 
% with the boundaries). 
% 
% Takes two numbers r (radius of coin) and N (number of trials) as input
%
% For r = 0.1, N = 1e5, this code estimates that about 64% of coin tosses
% will leave the coin fully within the grid. Increasing the number of
% trials to N = 1e6, 1e7... does not appear to change the estimate, so N =
% 1e5 seems to be an adequate number of trials to use.
% 
% The coin flip example was a binary problem that only depended on a single
% random variable, whereas this problem is inherently two-dimensional and
% requires a more involved series of checks to verify whether or not a
% trial succeeds or fails.

    % Initialize the number of times that the coin has landed fully within
    % the grid
    count = 0;
    
    % Loop through the number of trials, each of which represents a toss
    for i=1:N
        % Randomly generate the coordinates of the center of the coin,
        % (x,y), simulating where it lands within the grid
        x = rand();
        y = rand();
        
        % Check that the center position of the coin does not imply that it
        % intersects with the boundary of the grid. This corresponds to
        % checking that "neighborhoods" of width 2r around the x and y
        % coordinates remain within the grid.
        if ( (1 - x) > r && x > r ) && ( (1 - y) > r && y > r )
            count = count + 1;
        end
    end
    
    % The estimated probability that any given coin toss will land the coin
    % within the target grid is equal to to the number of trials which
    % satisfied this condition (count) divided by the total number of trials.
    prob = count / N;
end