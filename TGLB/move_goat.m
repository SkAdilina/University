function nodeOut=move_goat(nodeIn)
    nodeOut=nodeIn;
    if(nodeOut(4)==nodeOut(2))
        if nodeOut(4)==1
            nodeOut(4)=0;
            nodeOut(2)=0;
        elseif nodeOut(4)==0
            nodeOut(4)=1;
            nodeOut(2)=1;
        end
    end
end