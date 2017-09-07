disp('Welcome to AI lab: this script will help you through!')
disp('Todays Lab is on A* search!')
yourScore=0;

disp('Exercise 1: Find the path cost G(x)')
field1='state';
value1=generateInitial;
field2='steps';
value2=[];
field3='cost';
value3=0;
initialNode=struct(field1,value1,field2,value2);

myNode1=struct(field1,[0 1 3 7 8 6 2 5 4],field2,[0 0 3 1 1 3 0 0],field3,value3);
myNode2=struct(field1,[1 3 0 7 8 6 2 5 4],field2,[0 0 3 1 1 3],field3,value3);
cost1=pathCostGx(myNode1.steps);
cost2=pathCostGx(initialNode.steps);
cost3=pathCostGx(myNode2.steps);

if cost1==8 && cost2==0 && cost3==6
	disp('Cost Function g(x) implementation is correct!');
	yourScore=yourScore+2;
else
	disp('Cost Function g(x) implementation is NOT correct!')
end

input('Press enter key to continue...')
disp('Exercise 2: Implement Manhattan Distance')

costM1=manhattanDistance(myNode1.state);
costM2=manhattanDistance(myNode2.state);
costM3=manhattanDistance(initialNode.state);
costM4=manhattanDistance([0 3 6 1 4 7 2 5 8]);
costM5=manhattanDistance([0 0 0 0 0 0 0 0 0]);

if costM1==10 && costM2==8 && costM3==6 && costM4==0 && costM5==realmax
	disp('Manhattan Distance implementation is correct!')
	yourScore=yourScore+3;
else
	disp('Manhattan Distance implementation is NOT correct!')
end 

input('Press enter key to continue...');
disp('Exercise 3: Implement A* Search');

r=astar([0 1 3 7 8 6 2 5 4]);
if sum(r==[1 1 2 0 0 2 1 1 3 0 2 0 3 3])==length(r)
	disp('A* search implementation is correct!')
	yourScore=yourScore+5;
else
	disp('A* search implementation is NOT correct!')
end

input('Press enter key to continue...')
disp('Your Final Score:')
disp(yourScore);
input('Press enter key to continue....')
