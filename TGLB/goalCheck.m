function value=goalCheck(node)
value=0;
for i=1:4
    if sum(node == [1 1 1 1] )==4
        value=1;
        break;
    end
end
end