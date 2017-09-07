function value=goalCheck(node)
value=0;
% check if the node is a goal or not
if sum(node==[0 3 6 1 4 7 2 5 8])== 9
    value=1;
end