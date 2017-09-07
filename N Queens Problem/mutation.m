function x1=mutation(x,n)
    x1=x;
    i=0;
    i=mod(round(rand(1)*10),n-1);
    i=i+1;
    
    i1=0;
    i1=mod(round(rand(1)*10),n-1);
    i1=i1+1;

    x1(i)=i1;
end
