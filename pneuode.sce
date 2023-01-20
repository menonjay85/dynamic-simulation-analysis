//program to simulate ODEs with
//external arguments, pneumatic cylinder
clear
global a b c d ma mb Xo Yo L RT
a=0.8;//viscous damping coefficient
b=0.5;//mass
c=4;//piston leftside area
d=3;//piston rightside area
ma=-0.4;//left side flow in + and out -
mb=-.3;//right side flow in - and out +
Xo=13;//distance of the piston from the origin
Yo=5;//distance of the cylinder left edge from the origin
L=10;//cylinder stroke in cm
RT=20;//Ideal gas constant modified
//
//L=10 cm Xo= 8 cm
function ydot=h(t,y)
A=[0 1 0 0;0 -a/b c/b -d/b;0 0 0 0;0 0 0 0];
ydot=A*y+[0;0;-y(3,1)*y(2,1)/(Xo-Yo+y(1,1));y(4,1)*y(2,1)/(Yo+L-Xo-y(1,1))];
B=[0 0;0 0;RT/((Xo-Yo+y(1,1))*c) 0;0 RT/((Yo+L-Xo-y(1,1))*d)];
ydot=ydot+B*[ma;mb]*2400*(t)*exp(-3*t);
endfunction
//
y0=[Xo;0;6;8];
t0=0;
t=0:0.001:0.3;
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
xlabel('time: seconds');ylabel("$Y_{1}(t)$");
legends(["$Displacement$"],[2],opt="?")
xgrid

