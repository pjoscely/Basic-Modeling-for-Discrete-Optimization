%Calculate quarterly repayments

% variables
var float: R;        % quarterly repayment
var float: P = 10000.0;        % principal initially borrowed
var float: I= 0.05;  % interest rate

% intermediate variables
var float: B1; % balance after one quarter
var float: B2; % balance after two quarters
var float: B3; % balance after three quarters
var float: B4 = 0.0; % balance owing at end

constraint B1 = P * (1.0 + I) - R;
constraint B2 = B1 * (1.0 + I) - R;
constraint B3 = B2 * (1.0 + I) - R; 
constraint B4 = B3 * (1.0 + I) - R;

solve satisfy;

output [
 "Borrowing ", show_float(0, 2, P), " at ", show(I*100.0), 
 "% interest, and repaying ", show_float(0, 2, R), 
  "\nper quarter for 1 year leaves ", show_float(0, 2, B4), " owing\n"
];
/*
Borrowing 10000.00 at 5.0% interest, and repaying 2820.12
per quarter for 1 year leaves 0.00 owing
*/
