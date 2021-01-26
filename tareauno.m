
Ho=0;
R=0.5;
qi=1;
C=2;
m=R*qi;
uwu=R*C+1;
d=[0 uwu];
G = tf(m,d);
pole(G)
pzmap(G)
