function div_Vec = compute_Divisors(N)

    x = floor(sqrt(N));
    i = 1;
    div_Vec = [];
    
    while i <= x
        if (mod(N,i) == 0)
            div_Vec = [div_Vec i];
            if i^2 ~= N
                div_Vec = [div_Vec (N/i)];
            end
        end
        i = i+1;
    end
end