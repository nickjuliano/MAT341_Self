function time = calculate_Nested_For_Loop_Time(N)

% Computes the time it takes to execute a series of nested for loops
% 
% Input: An integer N, the number of iterations for each for loop

    tic
    k = 0;
    for i1 = 1:N
        for i2 = 1:N
            for i3 = 1:N
                for i4 = 1:N

                    k = k + 1;

                end
            end
        end
    end
    time = toc;

end