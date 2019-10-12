function quad_Roots_vary_L()

    count = 0;
    N = 2.5e4;
    LVec = [1e-3:0.5e-3:9e-3 1e-2:0.5e-2:9e-2 1e-1:0.5e-1:9e-1];
    probVec = [];
    
    for j=1:length(LVec)
       prob = quad_Roots(N,LVec(j));
       probVec = [probVec prob];
    end
    
    semilogx(LVec,probVec)
       
end
