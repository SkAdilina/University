function nodeOut=move_tiger(nodeIn)
    nodeOut=nodeIn;
    if(nodeOut(4)==nodeOut(1))
        if nodeOut(4)==1
            nodeOut(4)=0;
            nodeOut(1)=0;
        elseif nodeOut(4)==0
            nodeOut(4)=1;
            nodeOut(1)=1;
        end
    end
end