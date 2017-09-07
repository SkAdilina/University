function value=checkClosedList(ClosedList,node)
% this function will find if a node exists in the closed list or not
value=0;
for i=1:length(ClosedList)
    if sum(ClosedList(i).state == node.state)==9
        value=1;
        break;
    end
end