function steps=TGLB_a_star(stateInitial)


steps=[];
field1='state';
field2='steps';
field3='cost';
value1=stateInitial;
value2=[];
value3=0;
initialNode=struct(field1,value1,field2,value2,field3,bit(stateInitial));

frontier=[initialNode];
closedList=[];



while length(frontier)>0
    
    min=frontier(1).cost;
    ind=1;
    for i=2:length(frontier)
        v=frontier(i);
        if v.cost<min
            ind=i;
            min=v.cost;
        end
    end
    temp=frontier(1);
    frontier(1)=frontier(ind);
    frontier(ind)=temp;
    t=frontier(1);
    
    frontier=[frontier(2:length(frontier))];
    
    
    i=0;
    i=goalCheck(t.state);
    if i==1
        steps=t.steps
        break;
    end
    
    closedList=[closedList t];
     
    x1=t;
        x1.state=move_tiger(x1.state);
            %disp('move tiger')
        flag1=0;
        flag1=dangerCheck(x1.state);
        flag2=0;
        for i=1:length(closedList)
            if sum(closedList(i).state == x1.state)==4
                flag2=1;
                break;
            end
        end
        if flag2==0 && flag1==0
            x1.steps=[x1.steps 1];
            frontier=[frontier x1];
        end
        
    
        x1=t;
        x1.state=move_goat(x1.state);
            %disp('move goat')
        flag1=0;
        flag1=dangerCheck(x1.state);
        flag2=0;
        for i=1:length(closedList)
            if sum(closedList(i).state == x1.state)==4
                flag2=1;
                break;
            end
        end
        if flag2==0 && flag1==0
            x1.steps=[x1.steps 2];
            frontier=[frontier x1];
        end
        
        
        x1=t;
        x1.state=move_leaf(x1.state);
            %disp('move leaf')
        flag1=0;
        flag1=dangerCheck(x1.state);
        flag2=0;
        for i=1:length(closedList)
            if sum(closedList(i).state == x1.state)==4
                flag2=1;
                break;
            end
        end
        if flag2==0 && flag1==0
            x1.steps=[x1.steps 3];
            frontier=[frontier x1];
        end
        
        
        x1=t;
        x1.state=move_empty(x1.state);
            %disp('move empty')  
        flag1=0;
        flag1=dangerCheck(x1.state);
        flag2=0;
        for i=1:length(closedList)
            if sum(closedList(i).state == x1.state)==4
                flag2=1;
                break;
            end
        end
        if flag2==0 && flag1==0
            x1.steps=[x1.steps 0];
            frontier=[frontier x1];
        end
    end
end
