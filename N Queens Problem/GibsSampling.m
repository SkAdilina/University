function p=GibsSampling(n,iter)

    p=0;
    i=0;
    enter=0;
    x=randperm(n);
    d=getQuality(x,n);
    if(d==0) 
        enter=1;
        p=1;
        x;
    end
    
    
    while(i<iter)
        if enter==1
            break;
        end
        x1=randomChange(x,n);
        quality=getQuality(x1,n);
        if quality==0
            x1;
            p=1;
            break;
        end
        x=x1;
        i=i+1;
    end   
end