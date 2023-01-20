//program to simulate ODEs with
//external arguments, hydraulic cylinder
clear
global a b c d qa qb Xo Yo L MR
a=0.8;//viscous damping coefficient
b=0.5;//mass
c=4;//piston leftside area
d=3;//piston rightside area
qa=-0.4;//left side flow in + and out -
qb=-0.3;//right side flow in - and out +
Xo=13;//distance of the piston from the origin
Yo=5;//distance of the cylinder left edge from the origin
L=10;//cylinder stroke in cm
MR=20;// Modulus of rigidity N/cm2
//
//L=10 cm Xo= 8 cm
function ydot=h(t,y)
A=[0 1 0 0;0 -a/b c/b -d/b;0 0 0 0;0 0 0 0];
ydot=A*y+[0;0;MR*y(2,1)/(Xo-Yo+y(1,1));-MR*y(2,1)/(Yo+L-Xo-y(1,1))];
B=[0 0;0 0;MR/((Xo-Yo+y(1,1))*c) 0;0 MR/((Yo+L-Xo-y(1,1))*d)];
ydot=ydot+B*[qa;qb]*30*t*exp(-1.6*t);
endfunction
//
y0=[Xo;0;3*300;4*300];
t0=0;
t=0:0.001:2.84;
y=ode(y0,t0,t,h);
figure(0)
subplot(2,1,1)
plot(t',y',[2,3,4,5])
xlabel('time: seconds');ylabel('states: cms');
title("$Evolution\:of\:states\:of\:EVERYONE\:CHEATS\:model$");
legends(["$Y_{1}(t)$";"$Y_{2}(t)$";"$Y_{3}(t)$";"$Y_{4}(t)$"],[2,3,4,5],opt="?")
xgrid
//
subplot(2,1,2)
plot(t',(y(1,:))',[2])
xlabel('time: seconds');ylabel("$Y_{2}(t)$");
legends(["$Second\:State$"],[2],opt="?")
xgrid

