%Ejemplo del uso de funciones anónimas para generar señales elementales
close all; clear all; clc;

t1=-10; t2=10;
fs=100;
%Versión continua
my_t=t1:1/fs:t2;
%Versión discreta
my_n=t1:1:t2;

figure(1)
rampa='@(t)heaviside(t-1).*(t-1)';
func_rampa=str2func(rampa);
y_rampa=func_rampa(my_t);
%plot(my_t,y_rampa,'LineWidth',2); title(['Rampa unitaria r(t)'])

%Triangular
triangular = '@(t)y_rampa(t+1)';
func_triangular=str2func(triangular);
y_triangular=func_triangular(my_t);
plot(my_t,y_triangular,'LineWidth',2); title(['Triangular tri(t)'])

%%%%%
