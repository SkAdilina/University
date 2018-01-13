This is the Tiger,Goat,Leaf,Man and Boat Riddle:

There is a man who needs to cross a river. He needs to take the tiger, goat and leaf with him but unfortunately the boat is very small. He can only carry himself and another animal/leaf at a time. 
But the main problem is that if left alone 
- the tiger will eat the goat.  
- the goat will eat the leaf
However:
- If all 3 are left together, they won't do anything.
- The tiger can be left alone with the leaf 
(He can cross the river as many times as required, he can bring with him any item back and forth, he can move with empty boat)

I have used to different approach to solve the problem
1) Breath First Search - It is a very simple search algorithm which starts from the root. It traverses all the neighbouring nodes serially by maintaining a queue until all the nodes are visited. 
2) A* algorithm - it is an informed search algorithm which depends on heuristics to determined which node it will traverse. It maintains a priority queue in order to reach it's goal.

Solution Explanation
0 -> move empty boat (not taking tiger, goat/leaf)
1 -> move tiger
2 -> move goat
3 -> move leaf