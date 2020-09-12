int: m;
array [1..m] of var 1..9: x;
constraint sum(x) = product(x);
constraint forall(i in 1..m-1) (x[i] <= x[i+1]);
solve satisfy;