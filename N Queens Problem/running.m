
disp('Beginning of the data: ')
%x=[2 4 1 3];
%x=randperm(4)
%getQuality(x,4)
%x1=randomChange(x,4);
loop=0;

l=20;


%while(l>3)
    l=6
    MC=0;
    GS=0;
    HC=0;
    HCRW=0;
    SA=0;
    GA=0;
    loop=0;
    while(loop<10)
    
    m=MonteCarlo(l,1000);
        if(MonteCarlo(l,1000)==1)
            MC=MC+1;
        end
    g=GibsSampling(l,1000);
        if(GibsSampling(l,1000)==1)
            GS=GS+1;
        end
    h1=HillClimbing(l,1000);
        if(HillClimbing(l,1000)==1)
            HC=HC+1;
        end
    h2=HillClimbingRW(l,1000,0.05);
        if(HillClimbingRW(l,1000,0.05)==1)
            HCRW=HCRW+1;
        end
        if(SimulatedAnnealing(l,1000)==1)
            SA=SA+1;
        end
        if(GeneticAlgorithm(l,1000,l+1)==1)
            GA=GA+1;
        end
        loop=loop+1;
    end
    l=l-1;
    MC
    GS
    HC
    HCRW
    SA
    GA
%end

