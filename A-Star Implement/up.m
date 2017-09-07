function nodeOut=up(nodeIn)
% find the position of 0 and move it up or swap with the element in the
% above position to it 
%first copy nodeIn to nodeOut
%If there is not above position then return a zero matrix
nodeOut=nodeIn;

positionZero=find(~nodeOut);
if positionZero==1 || positionZero==4 || positionZero==7
    nodeOut=zeros(size(nodeIn));
else
    temp=nodeOut(positionZero-1);
    nodeOut(positionZero-1)=0;
    nodeOut(positionZero)=temp;
end