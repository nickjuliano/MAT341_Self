function prob = estimate_Triangle_Center_Circle_Probability(N)

% This Monte Carlo scheme estimates the probability that, given any three points on a
% circle of arbitrary radius centered at the origin of R^2, the triangle
% formed by these three points will contain the origin. It uses polar
% coordinates to define the points, and since all three points lie on the
% same circle, the radius of the circle does not affect the result.
%
% Takes as input the number of trials N.
%
% This code estimates that (for N = 1e5 or greater), the probability that
% an inscribed triangle contains the origin is about 0.25.

    % Initialize the number of successful trials
    count = 0;
    
    % Loop through the number of trials N
    for i=1:N
        % Define the points on the circle/triangle by their angular
        % position theta in polar coordinates. The range of theta is [0,
        % 2*pi], so randomly assign each of theta1, theta2, theta3 to an
        % angle in this range.
        theta1 = rand() * 2*pi;
        
        % To be certain that theta 2 does NOT equal theta1, only exit the
        % below while loop once they are distinct (if any two angles are
        % the same, then we do not have three points to draw a triangle).
        theta2 = theta1;
        while theta2 == theta1
            theta2 = rand() * 2*pi;
        end
        
        theta3 = theta2;
        while theta3 == theta1 || theta3 == theta2
            theta3 = rand() * 2*pi;
        end
        
        % The logic beyond this point checks whether or not the three
        % chosen points define a triangle which contains the origin. The
        % key idea to note is that for any two points theta1, theta2 on the
        % circle, the inscribed triangle contains the origin if and only if
        % the third angle theta3 is contained within the sector bounded by
        % the points theta1 + pi and theta2 + pi. For instance, if theta1 =
        % pi/4 and theta2 = 3*pi/4, then theta3 must lie somewhere between
        % 5*pi/4 and 7*pi/4 for its associated triangle to contain the
        % origin. Thus, we take theta1 and theta2 as given and check that
        % theta3 completes a "successful" triangle.
        
        % Define the lower and upper bounding points for the sector that
        % theta3 must lie on to form a successful triangle.
        low_bound = min(theta1 + pi, theta2 + pi);
        up_bound = max(theta1 + pi, theta2 + pi);
        
        % In principle, we need only check whether theta3 is between low_bound
        % and up_bound. In practice, however, we have four cases to check
        % due to the fact that theta3 is constrained to the interval [0,
        % 2*pi], but the bounding points are constrained to the interval
        % [pi, 2*pi].
        
        % Case 1: Both bounds are less than 2*pi, in which case we check
        % that theta3 is greater than low_bound and less than up_bound.
        if low_bound <= 2*pi && up_bound <= 2*pi
            if theta3 > low_bound && theta3 < up_bound
                count = count + 1;
            end
        % Case 2: Both bounds are greater than 2*pi. Similar to case 1,
        % only here we advance theta3 by one period and check that 
        % (theta3 + 2*pi) is greater than low_bound and less than up_bound.
        elseif low_bound > 2*pi && up_bound > 2*pi
            if (theta3 + 2*pi) > low_bound && (theta3 + 2*pi) < up_bound
                count = count + 1;
            end
        % Case 3: up_bound is greater than 2*pi, low_bound is less than
        % 2*pi, and (up_bound - pi) - low_bound < 0. Cases 3 and 4 deal
        % with the translation issue that occurs at theta = 2*pi, though
        % the conditions that follow are not very intuitive. The reasoning
        % behind them is best seen graphically.
        elseif (up_bound - pi) - low_bound < 0
            if theta3 > low_bound || (theta3 < low_bound && (theta3 + 2*pi < up_bound))
                count = count + 1;
            end
        % Case 4: up_bound is greater than 2*pi, low_bound is less than
        % 2*pi, and (up_bound - pi) - low_bound > 0. This is the "inverted 
        % case", as we require theta3 to be less than low_bound and greater
        % than up_bound.
        else
            if theta3 < low_bound && (theta3 + 2*pi) > up_bound
                count = count + 1;
            end
        end
              
    end
    
    % Divide the number of successful trials by the total number of trials
    % to estimate the probability of an inscribed triangle containing the
    % origin.
    prob = count / N;
      
end