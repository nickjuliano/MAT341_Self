function N = Nelder_Mead(tol)
    %   Implementation of the Nelder-Mead algorithm for approximating the
    %   minima of a two-variable function (defined at bottom of script).
    %
    %   Takes the desired error tolerance, tol, as input. Returns the
    %   number of iterations required to achieve this tolerance.
    %

    % Initial "guess" points, stored in vectors. Note that the labelings 
    % "Least", "Middle", and "Greatest" are arbitrary for these starting values.
    rLeast = [0.35 2.8];
    rMiddle = [4 4];
    rGreatest = [4.5 4.5];
    
    % Initialize error and loop counter
    err = 1;
    N = 0;
    
    while err > tol
        % Create a 2x3 matrix called rVec whose rows are the position vectors for our
        % three points.
        rVec = [rLeast; rMiddle; rGreatest];

        % Obtain function values at each of the three points, and store them
        % in a vector called fVec.
        fVec = [f(rLeast(1),rLeast(2)) f(rMiddle(1),rMiddle(2)) f(rGreatest(1),rGreatest(2))];
        
        % Arrange the function values in increasing order. Store the
        % location of each function value in fVec in a vector called
        % indsVec after they are sorted. For example, the first element in
        % indsVec corresponds to the least of the three function values,
        % and indsVec(1) points to the location of this value in fVec.
        [fSorted, indsVec] = sort(fVec);

        % Following from above, redefine the three position vectors
        % according to their function evaluations. "rLeast" is closest of the 
        % three to a minimum, while "rGreatest" is the farthest.
        rLeast = rVec(indsVec(1),:);
        rMiddle = rVec(indsVec(2),:);
        rGreatest = rVec(indsVec(3),:);

        % Define a position vector for the midpoint between the two points
        % closest to r_min (where a minimum occurs).
        rMidpoint = 0.5 * (rLeast + rMiddle);
        % Compute a "reach" vector through the midpoint in an attempt to
        % find a point whose function value is less than that of
        % rGreatest.
        rReach = rMidpoint + (rMidpoint - rGreatest);

        % If the reach point does in fact have a lesser function value than
        % rGreatest, it must be closer to a local minimum, so we replace
        % rGreatest with rReach.
        if f(rReach(1),rReach(2)) < f(rGreatest(1),rGreatest(2))
            rGreatest = rReach;
        else
        % If not, we instead try to find a replacement for rGreatest 
        % (called rC) halfway between rGreatest and rMidpoint.
            rC = 0.5*(rMidpoint + rGreatest);
            % Replace rGreatest with rC if the function value at rC is less
            % than that at rGreatest.
            if f(rC(1),rC(2)) < f(rGreatest(1),rGreatest(2))
                rGreatest = rC;
            % If we still have not found a better substitute for rGreatest,
            % shrink the size of the triangle formed by the three points in
            % rVec. Since all three points are closer to a minimum than
            % rReach and rC, this minimum must be relatively close to all
            % three independently. So, we narrow our search to part of the
            % region between all three points and repeat the loop (unless 
            % this shrunken triangle achieves the error tolerance).
            else
                rMiddle = 0.5 * (rLeast + rMiddle);
                rGreatest = 0.5 * (rLeast + rGreatest);
            end
        end

        % Define error to be the absolute value of the difference between 
        % the greatest and least function values of the points in rVec. 
        % If this difference is less than the error tolerance, we decide 
        % that the three points have "converged" to the location of a
        % minimum.
        err = abs(f(rGreatest(1),rGreatest(2)) - f(rLeast(1),rLeast(2)));
        N = N + 1;
    end
    
    % Once the error tolerance has been achieved, define location of the
    % approximated minimum to be rLeast and the minimum itself to equal the
    % function evaluated at rLeast.
    min = f(rLeast(1),rLeast(2));
    r_min = rLeast

end

% Function to minimize:
function val = f(x,y)
    val = -(sin(x) + cos(y));
end

%   Using initial points (0.35,2.8), (-0.25,0.3), and (1.5,0.5), this script
%   takes 29 iterations to achieve 1e-8 accuracy.
%
%   The above initial points seem to "converge" to r_min = (1.5715,
%   0.0008). Noting that the nearest true minimum of f(x) = -(sin(x) +
%   cos(y)) occurs at (pi/2, 0), it is clear that the approximated
%   and true locations of this minimum do not agree to 1e-8 accuracy. This
%   is because of how we defined error: the difference in function values
%   at rLeast and rGreatest must be less than or equal to 1e-8 for
%   "convergence", but this does not imply that rLeast is within a 1e-8
%   neighborhood of the true location of the minimum.
%
%   Changing the initial point (-0.25, 0.3) --> (1.75, 0.10), the algorithm
%   now takes 58 iterations to locate the same minimum as before, at (pi/2,
%   0). Though we have moved the second initial point closer to the
%   location of the minimum that the algorithm eventually locates, it takes
%   twice as many iterations than it did previously to converge. This would
%   certainly be nonsensical if we defined error to be the least distance
%   between any of our three points and the actual location of the minimum.
%   However, since we define error as the difference in the function values
%   of the three farthest points (rGreatest and rLeast), we are asking the
%   code to bring all three points sufficiently close such that their
%   function values end up in a neighborhood defined by tol. By moving the
%   second initial point closer to the location of the minimum, N is higher
%   because the code spends more iterations moving the first and third
%   points around to bring their function values within a neighborhood of
%   the minimum than it had to previously.
%
%   Changing the initial points (-0.25, 0.3) --> (4,4) and (1.5,0.5) -->
%   (4.5, 4.5), the algorithm finds the minimum at (-3pi/2, 0). It takes 53
%   iterations to achieve 1e-8 accuracy.
%