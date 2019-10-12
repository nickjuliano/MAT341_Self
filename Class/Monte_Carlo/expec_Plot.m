function expec_Plot(L_x,L_y)
    N = [1:1:10 20:10:100 100:100:1000];
    Y = [];
    
    for i=1:length(N)
       y = expected_Distance(N(i),L_x,L_y);
       Y = [Y y];
    end
    
    %semilogx(N,Y)
    
    
end