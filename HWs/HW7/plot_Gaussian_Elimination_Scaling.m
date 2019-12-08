function plot_Gaussian_Elimination_Scaling()
    %   Plots the operation count required to row reduce a square matrix to
    %   reduced row echelon form versus the size of the matrix for a
    %   variety of matrix sizes. This script calls the script
    %   "go_Go_Gaussian_Elimination", which takes number of rows/columns N 
    %   as input, to determine operation counts.
    %
    %   Takes no inputs, and returns nothing.
    
    % Vector of matrix sizes to compute operation counts for
    NVec = 2:1:100;
    OpCountVec = [];
    
    for i=1:length(NVec)
        OpCountVec = [OpCountVec go_Go_Gaussian_Elimination(NVec(i))];
    end
    
    % Log-log plot of operation count versus size of matrix
    figure(1);
    loglog(NVec, OpCountVec,'b','LineWidth', 5);
    xlabel('Size of Matrix, N');
    ylabel('Operation Count');
    
    % Linear plot of operation count versus size of matrix
    figure(2);
    plot(NVec, OpCountVec,'b','LineWidth', 5);
    xlabel('Size of Matrix, N');
    ylabel('Operation Count');

end

% As N increases, the number of operations required to compute the
% corresponding reduced row echelon form appears to scale exponentially
% with N. This because adding an additional row and column to a matrix does
% not add a flat number of operations to the row reduction process. Each
% row which was part of the matrix before the new row/column was
% added must now eliminate elements from this new row. Further, the added
% column means that each existing row now has an additional element which
% is present during all reduction steps.
%