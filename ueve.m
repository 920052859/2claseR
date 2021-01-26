from ROBERT GERARDO CASTRO SALGUERO to everyone:    1:11 PM
:)-m32*Ab(2,:)
m42=Ab(4,2)/Ab(2,2), Ab(4,:)=Ab(4,:)-m42*Ab(2,:)
m43=Ab(4,3)/Ab(3,3), Ab(4,:)=Ab(4,:)-m43*Ab(3,:)
% Factorizando por Doolite
U=Ab(1:4,1:4)
L=[1   0   0    0;
   m21 1   0    0;
   m31 m32 1    0;
   m41 m42 m43  1]
AA=L*U  % Debe ser igual a A
% A*x=b     L*U*x=b
% U*x=z  (2)
% L*z=b  (1)
% Resolviendo L*z=b  (Sustitucion Directa)
%    1.0000         0         0         0       z1         12        z1=12
%    2.0000    1.0000         0         0       z2     =   34        z2=10
%    0.5000    3.0000    1.0000         0       z3         27        z3=-9
%   -1.0000   -0.5000    2.0000    1.0000       z4        -38        z3=-3
z=L\b   % Sustitucion directa lo hace Matlab
% Resolviendo U*x=z  (Sustitucion)
%     6    -2     2     4        x1      12      x1=1
%     0    -4     2     2        x2  =   10      x2=-3
%     0     0     2    -5        x3      -9      x3=-2
%     0     0     0    -3        x4      -3      x4=1
x=U\z  % sustitucion inversa
