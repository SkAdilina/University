function nodeOut=move_empty(nodeIn)
    nodeOut=nodeIn;
    if nodeOut(4)==1
        nodeOut(4)=0;
    elseif nodeOut(4)==0
        nodeOut(4)=1;
    end
    
end