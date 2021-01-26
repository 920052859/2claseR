clc
clear all
p=[4 3 2 5]
e1=polyval(p,1)
e2=polyval(p,[0 1 2])
dp=polyder     (p)
e3=polyval(dp,3)
raices=roots(p)
q=poly([1 3 2 2])