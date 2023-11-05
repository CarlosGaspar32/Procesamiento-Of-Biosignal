clear;clc;close
% Definir la función simbólica
syms t;
f1 = t^2; % Tu función simbólica aquí
f2 = -t^2;
% Límites de la función
a = 0; % Límite inferior
b = pi;  % Límite superior
c = -pi;  
d = 0;
T = abs(a + b + c + d);
time1 = c:0.01:d;
time2 = a:0.01:b;
y1 = double(subs(f1,time1));
y2 = double(subs(f2,time2));

inicio1 = c - (-c+d) - (-c+d) - (-c+d) - (-c+d) - (-c+d);
final1 = d - (-c+d) - (-c+d) - (-c+d) - (-c+d) - (-c+d);

inicio2 = a - (a+b) - (a+b) - (a+b) - (a+b) - (a+b);
final2 = b - (a+b) - (a+b) - (a+b) - (a+b) - (a+b);

for i=-2:2
     inicio1 = inicio1 + (-c+d)+(a+b);
     final1 = final1 + (-c+d)+(a+b);
     inicio2 = inicio2 + (a+b)+(-c+d);
     final2 = final2 + (a+b)+(-c+d);
     time1 = inicio1:0.01:final1;
     time2 = inicio2:0.01:final2;
     plot(time1,y1,'b')
     
     hold on
     plot(time2,y2,'b')
end

