function steps=astar(stateInitial)
% this function will take the nodeInitial and return steps as a vector of
% steps here 0=UP 1= DOWN 2=RIGHT 3=LEFT 

%set up the initialnode

% Sample input = astar([1 3 6 2 7 8 5 4 0])
% Output for the Sample Input = 3 0 2 0 3 3

steps=[];

field1='state';
field2='steps';
field3='cost';
value1=stateInitial;
value2=[];
value3=0;
initialNode=struct(field1,value1,field2,value2,field3,pathCostGx(stateInitial)+manhattanDistance(stateInitial));

frontier=[initialNode];
closedList=[];

%while length(frontier)~=0
while length(frontier)>0
    % sort the frontier according to g(x)+h(x) or move the element with the smallest value to the top
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
    % extract a solution from top
    t=frontier(1);
    %delete it
    
    frontier=[frontier(2:length(frontier))];
    
    % goal check
    i=0;
    i=goalCheck(t.state);
    if i==1
        steps=t.steps;
        break;
    end
    
    closedList=[closedList t];
    % now expand and add the children to the frontier
    x1=t;
    x1.state=up(x1.state);
    hx=manhattanDistance(x1.state);
    flag1=0;
    if sum(x1.state == [0 0 0 0 0 0 0 0 0] )==9
        flag1=1;
    end
    flag2=0;
    for i=1:length(closedList)
        if sum(closedList(i).state == x1.state)==9
            flag2=1;
            break;
        end
    end
    if flag1==0 && flag2==0
        x1.steps=[x1.steps 0];
        gx=length(x1.steps);
        x1.cost=gx+hx;
        frontier=[frontier x1];
    end
    
    x1=t;
    x1.state=down(x1.state);
    hx=manhattanDistance(x1.state);
    flag1=0;
    if sum(x1.state == [0 0 0 0 0 0 0 0 0] )==9
        flag1=1;
    end
    flag2=0;
    for i=1:length(closedList)
        if sum(closedList(i).state == x1.state)==9
            flag2=1;
            break;
        end
    end
    if flag1==0 && flag2==0
        x1.steps=[x1.steps 1];
        gx=length(x1.steps);
        x1.cost=gx+hx;
        frontier=[frontier x1];
    end
    
    x1=t;
    x1.state=left(x1.state);
    hx=manhattanDistance(x1.state);
    flag1=0;
    if sum(x1.state == [0 0 0 0 0 0 0 0 0] )==9
        flag1=1;
    end
    flag2=0;
    for i=1:length(closedList)
        if sum(closedList(i).state == x1.state)==9
            flag2=1;
            break;
        end
    end
    if flag1==0 && flag2==0
        x1.steps=[x1.steps 3];
        gx=length(x1.steps);
        x1.cost=gx+hx;
        frontier=[frontier x1];
    end
    
    x1=t;
    x1.state=right(x1.state);
    hx=manhattanDistance(x1.state);
    flag1=0;
    if sum(x1.state == [0 0 0 0 0 0 0 0 0] )==9
        flag1=1;
    end
    flag2=0;
    for i=1:length(closedList)
        if sum(closedList(i).state == x1.state)==9
            flag2=1;
            break;
        end
    end
    if flag1==0 && flag2==0
        x1.steps=[x1.steps 2];
        gx=length(x1.steps);
        x1.cost=gx+hx;
        frontier=[frontier x1];
    end
end
%end
end


