//program to read from a txt file
B = fscanfMat("F:\SomeProg\Scilab\data1m.txt", "%lg");
xx = linspace(0,0.75,100);
x=B(:,1);y=B(:,6);z=B(:,4);w=B(:,5);
d1=splin(x,y);d2=splin(x,z);d3=splin(x,w);
yy1 = interp(xx,x,y,d1,"linear");
zz1 = interp(xx,x,z,d2,"linear");
ww1 = interp(xx,x,w,d3,"linear");
figure(0)
subplot(1,2,1)
plot(xx,yy1,'o')
xlabel("$value\:of\:F_{a}/C_{0}$")
ylabel("$e$")
title("$Calculating\:e\:for\:a\:roller\:bearing$")
xgrid(0.5)
subplot(1,2,2)
plot(xx,zz1,'.r')
set(gca(),"auto_clear","off")
plot(xx,ww1,'.b')
set(gca(),"data_bounds",matrix([0,0.75,0,2],2,-1));
xlabel("$value\:of\:e$")
ylabel("$X\:,\:Y$")
title("$Calculating\:X\:and\:Y\:for\:a\:roller\:bearing$")
xgrid(0.5)
xstring(.1,1.45,'Y')
xstring(.1,.57,'X')


