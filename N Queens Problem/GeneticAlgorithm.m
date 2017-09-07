function p=GeneticAlgorithm(n,iter,popSize)
	p=0;
    enter=0;
    population=zeros(popSize,n);
    for i=1:popSize
        population(i,:)=randperm(n);
    end
    for i=1:popSize
        quality=getQuality(population(i,:),n);
        if(quality==0)
            enter=1;
            p=1;
        end
    end
    
    i=0;
    while(i<iter)
        i=i+1;
        if(enter==1)
            break;
            
        end
        x=1;
        select1=randi(popSize);
            select=randi(popSize);
            [c1,c2]=crossover(n,population(select,:),population(select1,:));
            populationC(x,:)=[c1];
            x=x+1;
            populationC(x,:)=[c2];
            x=x+1;
        for j=(2:(popSize/2))
            select1=randi(popSize);
            select=randi(popSize);
            [c1,c2]=crossover(n,population(select,:),population(select1,:));
            populationC(x,:)=[c1];
            x=x+1;
            populationC(x,:)=[c2];
            x=x+1;
        end
        x=1;
            [c1]=mutation(population(1,:),n);
            populationM(x,:)=[c1];
            x=x+1;
        for j=2:popSize
            [c1]=mutation(population(j,:),n);
            populationM(x,:)=[c1];
            x=x+1;
        end
        x=1;
        population;
        populationC;
        populationM;
        total(x,:)=[population(1,:)];
            x=x+1;
        for j=2:length(population)
            total(x,:)=[population(j,:)];
            x=x+1;
        end
        for j=2:length(populationC)
            total(x,:)=[populationC(j,:)];
            x=x+1;
        end
        
        for j=2:length(populationM)
            total(x,:)=[populationM(j,:)];
            x=x+1;
        end
        
       total;
        
        for j=1:popSize
                minQ=getQuality(total(j,:),n);
                ind=j;
           for k=j+1:length(total)
               Q1=getQuality(total(k,:),n);
               if(minQ>Q1)
                   ind=k;
                   minQ=Q1;
               end
           end
           temp=total(j,:);
           total(j,:)=total(ind,:);
           total(ind,:)=temp;
           
        end
        
        
        x=1;
        for j=1:popSize 
            population(x,:)=[total(j,:)];
                x=x+1;
        end
        
        
        for j=1:popSize
            quality=getQuality(population(j,:),n);
            if(quality==0)
                p=1;
                enter=1;
            end
        end
        
    end  
end