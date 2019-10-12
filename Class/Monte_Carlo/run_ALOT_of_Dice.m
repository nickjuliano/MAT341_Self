function run_ALOT_of_Dice()
    
    NVec = [1:1:10 20:5:100 150:50:1000 1500:500:10000 1.5e4:5e3:1e5];

    for i=1:length(NVec)
        probN = estimate_Die_Probability(NVec(i));
        err(i) = abs( probN - 1/6 );
    end
    
    loglog(NVec,err,'r*')
    xlabel('Number of Rolls')
    ylabel('Error')
    set(gca,'FontSize',12);

end