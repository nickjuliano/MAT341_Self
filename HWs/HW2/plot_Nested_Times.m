function plot_Nested_Times()

% Creates a plot of the time in seconds it takes for series of
% nested for loops to execute versus the number of iterations in each for loop.
% Time for each nest is computed in "calculate_Nested_For_Loop_Time".

    N = [1:1:10 20:10:100 125 150 175 200 225 250]; % Vector storing the numbers
    % of iterations that we wish to include in the plot
    T = []; % Initializing a vector to store the execution time for each number
    % of iterations in N

    % Loop which runs "calculate_Nested_For_Loop_Time" for each number in
    % N, and stores the result in vector T
    for n=1:length(N)
        t = calculate_Nested_For_Loop_Time(N(n));
        T = [T t];
    end
    
    % Creates a log-log plot of T versus N, with specified line width,
    % color, and axes titles
    lw = 1.5;
    loglog(N,T,'m','LineWidth',lw)
    xlabel('Number of For Loop Iterations')
    ylabel('Time [s]')
    
end