function value=dangerCheck(node)
state=node;

value=0;
    
    if state(1)==0 || state(2)==0 || state(3)==0
        if state(1)==0 && state(2)==0 && state(3)==0
            value=0;
        elseif state(1)==state(2) && state(4)~=state(1)
            value=1;
        elseif state(2)==state(3) && state(4)~=state(2)
            value=1;
        end
    end
   
end