//program to solve simultaneous equations
// x + 2 y + 3 z = 19
// -9 x + 5 y + 6 z = -5
// 7 x + 8 y + 9 z = 1
clear all
A=[1 2 3;-9 5 6;7 8 9]; //Coefficient matrix
b=[19;-5;1]; //RHS
X=inv(A)*b; //solution
