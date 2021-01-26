syms s;
f = (1/s)*((s+1)*(s+2)*(s+3))/((s+4)*(s+5)*(s+6));
s0 = -4;
f
%Res = limit(f*(s+4),s,s0);
expand((s+4)*(s+5)*(s+6))

coeffs((s+4)*(s+5)*(s+6))

sym2poly((s+4)*(s+5)*(s+6))

F = (s+1)*(s+2)*(s+3)