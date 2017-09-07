
function m=manhattanDistance(stateIn)
% for any given node nodeIn calculate the manhattan distances
m=0;
check=[0 1 2;3 4 5;6 7 8];
flag=0;
if sum(stateIn == [0 0 0 0 0 0 0 0 0] )==9
    flag=1;
end

if flag==1
    m=realmax;
else
   b=reshape(stateIn,3,3);
   for i=1:8
       [r1,c1]=find(check==i);
       [r2,c2]=find(b==i);
       m=m+(abs(r1-r2)+abs(c1-c2));
   end
end

end
