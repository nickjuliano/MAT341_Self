function val = square_Root_Sequence(m,n)

% Numerically approximates the limit of a sequence involving successive
% square roots
%
% Inputs: A (positive) real number m to use as the generator of the sequence
%         A integer n, to indicate which term in the sequence to calculate.
%           Use large n to approximate the limit of a given sequence.

    val = 0;
    
    % Loop which builds the nth term in the sequence. Notice that even- and
    % odd-indexed terms cannot be built iteratively from one another, and
    % so this loop does not consider prior terms in the sequence.
    for i=1:n
        val = sqrt(m + (-1)^(n+i+1) * val);
    end

    % For:
    %       m = 13, limit appears to be 3
    %       m = 31, limit appears to be 5
    %       m = 43, limit appears to be 6
end