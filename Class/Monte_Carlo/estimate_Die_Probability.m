function prob = estimate_Die_Probability(N)
    %
    %   Estimates the probability of rolling a 5 on a die using a Monte
    %   Carlo scheme.
    %
    %   input: 1) N: total number of dice rolls
    
    count5 = 0;

    for i=1:N

       roll = roll_Die();
       if roll == 5
           count5 = count5 + 1;
       end

    end

    prob = count5 / N;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = roll_Die()
    val = rand();
    val = val * 6;
    val = ceil(val);
end


