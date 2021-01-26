clear; close all; clc
%Sea la funcion de transferencia:
%           0.5(1+5s)
% G(s) = ---------------
%        s(1+s)(1+tau*s)

tau = [0.2,0.5,0.8,1];

for i=1:length(tau)
    G = tf([2.5 0.5],conv(conv([1 0],[1 1]),[tau(i) 1]));
    hold on
    w = logspace (-1,2);
    bode(G,w)
    grid
end