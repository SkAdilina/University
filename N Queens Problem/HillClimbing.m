function p=HillClimbing(n,iter)

    p=0;
    i=0;
    enter=0;
    x=randperm(n);
    quality=getQuality(x,n);
    if(quality==0) 
        p=1;
        enter=1;
        x;
    end
    
    
    while(i<iter)
        if(enter==1)
            break;
        end
        x1=randomChange(x,n);
        quality1=getQuality(x1,n);
        if (quality1==0)
            x1;
            p=1;
            break;
        end
        if quality1 <= quality
            x=x1;
            quality=quality1;
        end
        i=i+1;
    end   
end