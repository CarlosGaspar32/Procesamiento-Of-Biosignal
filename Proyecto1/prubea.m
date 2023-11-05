clear;clc;close
% Definir la función simbólica
syms t;
f = t; % Tu función simbólica aquí

% Límites de la función
a = -pi; % Límite inferior
b = pi;  % Límite superior
time = a:0.001:b;
y = double(subs(f,time));

inicio = a - (b-a) - (b-a) - (b-a);
final = b - (b-a) - (b-a) - (b-a) ;
for i=-2:2
     inicio = inicio + (b-a);
     final = final + (b-a);
     time = inicio:0.001:final;
     plot(time,y,'b')
     
     hold on
end
drawnow
grid minor
