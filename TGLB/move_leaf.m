function nodeOut=move_leaf(nodeIn)
    nodeOut=nodeIn;
    if(nodeOut(4)==nodeOut(3))
        if nodeOut(4)==1
            nodeOut(4)=0;
            nodeOut(3)=0;
        elseif nodeOut(4)==0
            nodeOut(4)=1;
            nodeOut(3)=1;
        end
    end
    
end