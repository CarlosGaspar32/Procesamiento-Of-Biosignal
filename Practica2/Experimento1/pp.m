%Ejemplo del uso de funciones anónimas para generar señales elementales
close all; clear all; clc;

t1=-10; t2=10;
fs=100;
%Versión continua
my_t=t1:1/fs:t2;
%Versión discreta
my_n=t1:1:t2;

tria='@(t)(heaviside(t+1).^(t+1)-2*(heaviside(t).*(t))+(heaviside(t-1).*(t-1)))'
funtria=str2func(tria);
ytria=funtria(my_t)
plot(my_t,ytria)