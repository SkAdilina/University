disp('Begin1')

initial=generateInitial();
%current=move_empty(initial)
%current=move_tiger(current)
%value=goalCheck(current)
%current=[1 1 0 1]
%val=dangerCheck(current)
TGLB_a_star(initial);
%TGLB_bfs(initial);
