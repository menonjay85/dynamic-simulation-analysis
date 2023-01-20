//function to compute 59 different answers
//DMEII test
//test the fitness of a made up bearing
//d=30 D=55 B=13 (mm) Co=6800 C=13300 (N)
ntest=input('number of tests')
B1 = fscanfMat("C:\Users\Venkatesh.Deshmukh\Documents\Scilab\datam3.txt", "%lg");
exec rollbear.sci;
for i=1:1:ntest,
[C(i,1) ec(i,1) aor(i,1) Xc(i,1) Yc(i,1)]=rollbear(B1(i,3),B1(i,2),B1(i,4),B1(i,5));
end
nc=length(C);
Res=[(1:nc)' C(:,1) B1(1:nc,6) ec(1:nc,1) aor(1:nc,1) Xc(1:nc,1) Yc(1:nc,1)];
fprintfMat("C:\Users\Venkatesh.Deshmukh\Documents\Scilab\prot.txt",Res,"%5.7f");
