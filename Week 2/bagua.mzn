int: nSpots = 10;
set of int: SPOT = 1..nSpots;
array[SPOT] of int: damage = [10, 8, 4, 2, 6, 9, 5, 3, 8, 10];
%int: size = 3;
enum SYMB = {A,B,C,D,E,F,G,H}; % name them properly !;   
array[SYMB] of set of SPOT: group = [{1, 4, 6}, {1, 2, 6, 7}, {1, 3, 6, 8}, {1, 2, 3}, {2, 9, 10}, {5, 6, 8, 10}, {7, 8, 10}, {1, 3, 5}];

var set of SPOT: attacks; % decision variable (set variable)

constraint forall(s in SYMB)(card(attacks intersect group[s]) <= 1);

%constraint card(attacks) = size;

var int: totalDamages = sum(p in attacks)(damage[p]);

% Goal: maximize attack reward
solve maximize (totalDamages);

output["Attacks: ", show(attacks), " and damages: ", show(totalDamages)]
