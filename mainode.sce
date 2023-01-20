//program to simulate ODEs with
//external arguments, in scilab you have to
//write a function and use list
clear all
global a b c d
a=2;b=3;c=4;d=5;

function ydot=h(t,y)
A=-[a*2 0 1-b 1;-3 d^2 c-b 1;3 8 2 -9;5-a b -2 3];
ydot=A*y+[2*sin(40*t);-5*sin(y(2,1));0;(t+5)/(t+7)];
endfunction

//global a b c d
//a=2;b=3;c=4;d=5;
//A=-[a*2 0 1-b 1;-3 d^2 c-b 1;3 8 2 -9; ..
//5-a b -2 3];
y0=[1;2;3;4];
t0=0;
t=0:0.001:10;
y=ode(y0,t0,t,h);
figure(0)
subplot(2,2,1)
plot(t,y,[2,3,4,5])
xlabel('time: seconds');ylabel('states: cms');
title("$Evolution\:of\:states\:of\:EVERYONE\:CHEATS\:model$");
legends(["$Y_{1}(t)$";"$Y_{2}(t)$";"$Y_{3}(t)$";"$Y_{4}(t)$"],[2,3,4,5],opt="?")
subplot(2,2,2)
set(gca(),"data_bounds",matrix([0,10,-3,3],2,-1));
plot(t,2*sin(40*t),[2])
xlabel('time: seconds');ylabel("$sin(40t)$");
title("$Clarence\:Gatemouth\:Brown$");
legends(["$F_{1}$"],[2],opt="?")
subplot(2,2,3)
plot(t,(t+3)./(t+5),[2])
xlabel('time: seconds');ylabel("$\frac{t+3}{t+5}$");
legends(["$F_{4}$"],[2],opt="?")
subplot(2,2,4)
plot(t,(y(2,:)),[2])
xlabel('time: seconds');ylabel("$Y_{2}(t)$");
legends(["$Second\:State$"],[2],opt="?")

