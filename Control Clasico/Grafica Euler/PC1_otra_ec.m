clear all; clc; close all;
%%Constantes
K = 30.03e-3;
j = 1;
L = 2;
R = 6.5;
V = 10;

%%Variables
i = (0);
w = (0);
a = 0;
b = 10;
n = 10000;
%%Variaciones
di = 0;
dw = 0;
dt = (b-a)/n;
tf = 10;
t = (0);

while(t(n) <= tf)
    dw = ((K*i(n))/j)*dt;
    di = ((V-i(n)*R-K*w(n))/L)*dt;
    i(n+1) = i(n) + di;
    w(n+1) = w(n) + dw;
    t(n+1) = t(n) + dt;
    n = n + 1;
    
end
grid minor;
hold on;
plot(t,i,'DisplayName','i vs t');
%plot(t,w,'DisplayName','w vs t');
legend;