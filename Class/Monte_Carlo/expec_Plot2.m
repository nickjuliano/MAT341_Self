function expec_Plot2(L_y)
    N = 1e3;
    L_x = [0.1:0.1:1 10:10:100 100:100:1e3];
    Y = [];
    
    for i=1:length(L_x)
       y = expected_Distance(N,L_x,L_y);
       Y = [Y y];
    end
    
    AR = [];
    AR(i) = L_x(i) / L_y;
    
    semilogx(AR,Y)
    
end