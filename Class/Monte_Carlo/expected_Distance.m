function avg = expected_Distance(N,L_x,L_y)
    
    D = 0;
    
    for i=1:N
        x_1 = rand() * L_x;
        y_1 = rand() * L_y;
        x_2 = rand() * L_x;
        y_2 = rand() * L_y;
        
        d = sqrt((x_2 - x_1)^2 + (y_2 - y_1)^2);
        D = D + d;
    end
    
    avg = D / N;

end