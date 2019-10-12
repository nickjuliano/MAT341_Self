function general_Roots_Plot()
    
    probVec = [];
    
    for deg=0:20
        prob = general_Roots(2.5e4,deg);
        probVec = [probVec prob];
    end

    
end