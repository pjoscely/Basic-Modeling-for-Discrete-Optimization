/*
Data File

PRODUCT = {AXE, SWORD, PIKE, SPEAR, CLUB};
profit =  [11.0, 18.0, 15.0, 17.0, 11.0];
RESOURCE = {IRON, WOOD, SMITH, CARPENTER};
capacity = [5000, 7500, 4000, 3000];
consumption = [| 1.5, 1.0, 1.0, 1.0 
               | 2.0, 0.0, 2.0, 0.0
               | 1.5, 0.5, 1.0, 1.0 
               | 0.5, 1.0, 0.9, 1.5
               | 0.1, 2.5, 0.1, 2.5 |];
*/

% products 
enum PRODUCT;  
% Profit per unit for each product
array[PRODUCT] of float: profit; 

% resources
enum RESOURCE; 
% Amount of each resource available
array[RESOURCE] of float: capacity; 

% Units of each resource required to produce 
%       1 unit of product
array[PRODUCT,RESOURCE] of float: consumption; 

% Variables: how much should we make of each product
array[PRODUCT] of var int: produce;

% Must produce a non-negative amount
constraint forall(p in PRODUCT)
			   (produce[p] >= 0);

% Production can only use the available resources:
constraint forall (r in RESOURCE)(
 sum (p in PRODUCT)(consumption[p, r] * produce[p]) <= capacity[r]
); 

% Maximize profit
solve maximize sum(p in PRODUCT)   
                  (profit[p]*produce[p]);

output [ "\(p): \(produce[p])\n" | p in PRODUCT ]++["PROFIT: \(sum(p in PRODUCT)(profit[p]*produce[p]))"];

/*
AXE: 0
SWORD: 632
PIKE: 2340
SPEAR: 440
CLUB: 0
PROFIT: 53956.0
----------
==========
Finished in 154msec
*/