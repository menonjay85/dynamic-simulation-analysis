//function to compute 60 different answers
//DMEII test
function [C,ec,aor,Xc,Yc]=rollbear(Fa,Fr,Co,L10);
B = fscanfMat("C:\Users\Venkatesh.Deshmukh\Documents\Scilab\data1m.txt", "%lg");
aor=Fa/Fr;
xx = Fa/Co;//find Fa/Co starting point
x=B(:,1);y=B(:,6);z=B(:,4);w=B(:,5);
d1=splin(x,y);d2=splin(x,z);d3=splin(x,w);
yy1 = interp(xx,x,y,d1,"linear");//value of e
zz1 = interp(xx,x,z,d2,"linear");//value of X for Fa/Fr >= e
ww1 = interp(xx,x,w,d3,"linear");//value of Y for Fa/Fr >= e
if Fa/Fr >= yy1
    P=zz1*Fr+ww1*Fa;
    C=P*(L10)^(1/3);
    ec=yy1;Xc=zz1;Yc=ww1;
else
    P= Fr;C=P*(L10)^(1/3);
    ec=yy1;Xc=1;Yc=0;
    end
endfunction
