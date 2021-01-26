tic;
clear all; clc; close all;
%%Constantes
y = 9;
a = 3;
alfa  = 1;
beta  = 1;
lm = 2;
l2 = 1;
j = 1;
tc = 6;
wo = 1;
pn = 1;

%%Entradas
u1u = 1;
u1v = 1;

%%Variables
i1u = (2);
i1v = (2);
f2u = (2);
f2v = (2);
w = (2);

%%Variaciones
di1u = 0;
di1v = 0;
df2u = 0;
df2v = 0;
dw = 0;
dt = 0.0001;
tf = 1;
t = (0);
i = 1;

while(t <= tf)
    di1u = ((u1u/a)-(y*i1u(i))+(wo*i1v(i))+(alfa*beta*f2u(i))+(beta*w(i)*f2v(i)))*dt;
    di1v = ((u1v/a)-(y*i1v(i))+(wo*i1u(i))-(alfa*beta*f2v(i))-(beta*w(i)*f2u(i)))*dt;
    df2u = (-alfa*f2u(i)+(wo-w(i))*pn*f2v(i)+alfa*lm*i1u(i))*dt;
    df2v = (-alfa*f2v(i)-(wo-w(i))*pn*f2u(i)+alfa*lm*i1v(i))*dt;
    dw = (3*lm/(2*l2)*(f2u(i)*i1v(i)-f2v(i)*i1u(i))/j-tc/j)*dt;
    i1u(i+1) = i1u(i) + di1u;
    i1v(i+1) = i1v(i) + di1v;
    f2u(i+1) = f2u(i) + df2u;
    f2v(i+1) = f2v(i) + df2v;
    w(i+1) = w(i) + dw;
    t(i+1) = t(i) + dt;
    i = i + 1;
end
grid on;
hold on;
plot(t,i1u,'DisplayName','ilu');
plot(t,i1v,'DisplayName','ilv');
plot(t,f2u,'DisplayName','f2u');
plot(t,f2v,'DisplayName','f2v');
plot(t,w,'DisplayName','w');
legend;
toc;