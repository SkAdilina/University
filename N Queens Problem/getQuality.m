function quality=getQuality(x,n)

    quality=0;
    for i=1:n-1
        for j=i+1:n
            if x(i)==x(j)
                quality=quality+1;
            end
            if abs(i-j)==abs(x(i)-x(j))
                quality=quality+1;
            end
        end
    end
    
end