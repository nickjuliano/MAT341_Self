function vary_Radii_Plot()

% Creates a plot of the estimated probability that a coin, when tossed,
% will land fully within a square grid versus the radius of the coin.
% Probabilities are computed in "estimate_Coin_In_Square_Probability".
%
% According to this plot, r = 0.15 approximately corresponds to a
% probability of 0.5, r = 0.35 to a probability of 0.1, and r = 0.5 to a
% probability of 0.01.

    % Initialize a vector of different radii to compute probabilities
    % for. Also initialize a vector to store the probabilities, and set the
    % number of trials N.
    rVec = [0.01:0.005:0.10 0.1:0.01:0.5];
    probVec = [];
    N = 1e5;
    
    % Compute probability for each radius in rVec and store in probVec.
    for i=1:length(rVec)
        prob = estimate_Coin_In_Square_Probability(rVec(i),N);
        probVec = [probVec prob];
    end

    % Plot probability versus radius and set plot properties.
    lw = 1.5;
    plot(rVec,probVec,'r','LineWidth',lw)
    xlabel('Radius')
    ylabel('Probability')

end