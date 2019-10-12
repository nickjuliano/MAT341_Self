function val = compute_gcd(x,y)

    div_Vec_x = compute_Divisors(x);
    div_Vec_y = compute_Divisors(y);
    com_div = [];
    
    for i = 1:length(div_Vec_x)
        for j = 1:length(div_Vec_y)
            if div_Vec_x(i) == div_Vec_y(j)
                com_div = [com_div div_Vec_x];
            end
        end
    end
    val = max(com_div);
end