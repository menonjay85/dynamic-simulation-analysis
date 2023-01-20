//write a function for dilating a mtrix
function [detA,dA]=dilat(a,b,c,d,A,ndof)
detA=det(A);
S(1:4,1:ndof)=0;
S(1,a)=1;S(2,b)=1;S(3,c)=1;S(4,d)=1;
dA=S'*A*S;
endfunction
