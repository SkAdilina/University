function [c1,c2]=crossover(n,p1,p2)

p1;
p2;
cross=randi(n-1);

c1=[p1(1:cross) p2(cross+1:n)];
c2=[p2(1:cross) p1(cross+1:n)];
end