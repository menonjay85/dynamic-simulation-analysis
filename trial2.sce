//program to dilate a matrix
ndof=6;
exec dilat.sci;
A1=[1 -2 3 4;-3 -11 12 39;17 3 18 -2;-4 53 -23 21];
A2=[10 -12 -1 41;-31 -1.1 12.3 -39;1.7 -3 1.8 -2;12 -53 -2.3 2.1];
[c1,A1g]=dilat(1,2,3,4,A1,ndof);
[c2,A2g]=dilat(3,4,5,6,A2,ndof);
F=[1;-2;3;-4;5;-6];
Q=inv(A1g+A2g)*F;
