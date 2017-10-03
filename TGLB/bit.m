
function m=bit(stateIn)
m=0;
stateOut=stateIn;
for i=1:4
    if stateOut(i)==0
        m=m+1;
    end
end

end
