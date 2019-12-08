function OpCount = go_Go_Gaussian_Elimination(N)
    %   Performs elementary row operations to convert a square, 
    %   real-valued matrix to row echelon and then reduced row echelon form.
    %
    %   Takes N, the number of rows and columns of a square, real-valued
    %   matrix, as input. Returns OpCount, the number of arithmetic
    %   operations required to convert the matrix to reduced row echelon
    %   form.

    % Generate a square matrix whose elements are randomly generated real
    % numbers between 0 and 1.
    A = rand(N,N);
    OpCount = 0;
    
    % Routine to row reduce A to row echelon form
    %
    % Note that we assume A has N pivot positions and that no row has a
    % leading term equal to zero. Though not true in general, they are good
    % assumptions here given the the nature of A's elements.
    for i=1:N
        % Divide each row by the value of the leading term. Each matrix
        % element divided in this way counts as an operation.
        for j=i:N
            A(i,j) = A(i,j)/A(i,i);
            OpCount = OpCount + 1;
        end
        
        if i ~= N
            for ii = i+1:N
                % Subtract multiples of the current (ith) row to all rows below
                % it so that only zeros remain below row i's pivot
                % position. To change the value of an individual element in
                % this way, we must perform both a multiplication and a
                % subtraction, so we add two the operation count for every
                % matrix element changed in this step.
                for j=i:N
                    A(ii,j) = A(ii,j) - A(ii,i)*A(i,j);
                    OpCount = OpCount + 2;
                end
            end
        end
    end
    
    % Routine to convert A to reduced row echelon form
    for i=2:N
        % Since all leading terms equal 1, we must essentially subtract each
        % nonzero element above a pivot position from itself. However, we
        % are technically mulitplying by one before the subtraction, so we
        % add two to the operation count for each matrix element changed in
        % this step.
        for ii=1:i-1
            A(ii,i) = A(ii,i) - A(ii,i)*A(i,i);
            OpCount = OpCount + 2;
        end
    end


end