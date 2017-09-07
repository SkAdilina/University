function p=MonteCarlo(n,iter)
    
    p=0;
    flag=0;
    i=0;
    while(i<iter)
        x=randperm(n);
        quality=getQuality(x,n);
        if quality==0
            x;
            p=1;
            break;
        end
        i=i+1;
    end 
end