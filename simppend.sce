//program to simulate ODEs with
//external arguments, in scilab you have to
//write a function and use list
clear all

function ydot=hp(t,y)
g=9.81;l=0.5;c=0.01;
ydot=[y(2,1);-(g/l)*sin(y(1,1))-c*y(2,1)];
endfunction

////
y0=[%pi/6;0];
t0=0;
t=0:0.001:25;
y=ode(y0,t0,t,hp);
figure(0)
plot(t',y',[2,3])
xlabel('time: seconds');ylabel('states: rad rad/s');
title("$Evolution\:of\:the\:states\:of\:Simple\:Pendulum\:model$");
legends(["$Y_{1}(t)$";"$Y_{2}(t)$"],[2,3],opt="?")
figure(1)
plot((y(1,:))',(y(2,:))')
xlabel('displacement:rad');ylabel('velociy: rad/s');
title("$A\:Phase\:Space\:plot\:of\:Simple\:Pendulum$");
