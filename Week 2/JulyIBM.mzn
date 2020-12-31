var 0..120: a; 
var 0..120: b;
var 0..120: c;  

var 0..120: x1; 
var 0..120: x2;
var 0..120: x3; 

var 0..120: y1; 
var 0..120: y2;
var 0..120: y3;  

var 0..120: z1; 
var 0..120: z2;
var 0..120: z3; 

var 0..120: w1; 
var 0..120: w2;
var 0..120: w3;  

var 0..120: s1; 
var 0..120: s2;
var 0..120: s3;  


var 0..120: t1; 
var 0..120: t2;
var 0..120: t3;  



constraint a+b+c == x1+x2+x3;
constraint a*b*c == x1*x2*x3;
constraint (a!=x1\/b!=x2\/c!=x3);
constraint a<=b/\b<=c;
constraint x1<=x2/\x2<=x3;

constraint a+b+c+3 == y1+y2+y3;
constraint (a+1)*(b+1)*(c+1) == (y1)*(y2)*(y3);
constraint a+1!=y1\/b+1!=y2\/c+1!=y3;
constraint y1<=y2/\y2<=y3;


constraint a+b+c+6== z1+z2+z3;
constraint (a+2)*(b+2)*(c+2) ==(z1)*(z2)*(z3);
constraint a+2!=z1\/b+2!=z2\/c+2!=z3;
constraint z1<=z2/\z2<=z3;

constraint a+b+c+9== w1+w2+w3;
constraint (a+3)*(b+3)*(c+3)== (w1)*(w2)*(w3);
constraint a+3!=w1\/b+3!=w2\/c+3!=w3;
constraint w1<=w2/\w2<=w3;

constraint a+b+c+12== s1+s2+s3;
constraint (a+4)*(b+4)*(c+4)== (s1)*(s2)*(s3);
constraint a+4!=s1\/b+4!=s2\/c+4!=s3;
constraint s1<=s2/\s2<=s3;

% constraint a+b+c+15== t1+t2+t3;
% constraint (a+5)*(b+5)*(c+5)== (t1)*(t2)*(t3);
% constraint a+5!=t1\/b+5!=t2\/c+5!=t3;
% constraint t1<=t2/\t2<=t3;

solve satisfy;