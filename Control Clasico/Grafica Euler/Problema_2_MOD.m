tic;
clear all; clc; close all;
%%Constantes
y = 1;
a = 1;
alfa  = 1;
beta  = 1;
lm = 1;
l2 = 1;
j = 1;
tc = 1;
wo = 1;
pn = 1;

%%Entradas
u1u = 1;
u1v = 1;

%%Variables
i1u = 2;
i1v = 2;
f2u = 2;
f2v = 2;
w = 2;
i1ua = 0;
i1va = 0;
f2ua = 0;
f2va = 0;
wa = 0;

%%Variaciones
di1u = 0;
di1v = 0;
df2u = 0;
df2v = 0;
dw = 0;
dt = 0.0001;
tf = 1;
t = 0;
ta = 0;
i = 1;

%%TRAMOS
T1=[0 0];
T2=[0 0];

while(t <= tf)
    di1u = ((u1u/a)-(y*i1u)+(wo*i1v)+(alfa*beta*f2u)+(beta*w*f2v))*dt;
    di1v = ((u1v/a)-(y*i1v)+(wo*i1u)-(alfa*beta*f2v)-(beta*w*f2u))*dt;
    df2u = (-alfa*f2u+(wo-w)*pn*f2v+alfa*lm*i1u)*dt;
    df2v = (-alfa*f2v-(wo-w)*pn*f2u+alfa*lm*i1v)*dt;
    dw = (3*lm/(2*l2)*(f2u*i1v-f2v*i1u)/j-tc/j)*dt;
    T1(1) = t;
    T2(1) = i1u;
    i1u = i1u + di1u;
    i1v = i1v + di1v;
    f2u = f2u + df2u;
    f2v = f2v + df2v;
    w = w + dw;
    t = t + dt;
    T1(2) = t;
    T2(2) = i1u;
    line(T1,T2);
end
toc;

%%OBSERVACIÓN: DEMORA MÁS IR REALIZANDO TROZO POR TROZO QUE REALIZARLO TODO
%%DE UNA