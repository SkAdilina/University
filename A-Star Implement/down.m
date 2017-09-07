function nodeOut=down(nodeIn)
% find the position of 0 and move it up or swap with the element in the
% above position to it 
%first copy nodeIn to nodeOut
%If there is not above position then return a zero matrix
nodeOut=nodeIn;

positionZero=find(~nodeOut);
if positionZero==3 || positionZero==6 || positionZero==9
    nodeOut=zeros(size(nodeIn));
else
    temp=nodeOut(positionZero+1);
    nodeOut(positionZero+1)=0;
    nodeOut(positionZero)=temp;
end