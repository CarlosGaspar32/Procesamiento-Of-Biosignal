%Ejemplo del uso de funciones anónimas para generar señales elementales
close all; clear all; clc;

t1=-10; t2=10;
fs=100;
%Versión continua
my_t=t1:1/fs:t2;
%Versión discreta
my_n=t1:1:t2;

figure(1)
%La función heaviside emula al escalon unitario
escalon='@(t)heaviside(t)';
func_esc=str2func(escalon);
y_escalon=func_esc(my_t);
subplot(3,1,1)
plot(my_t,y_escalon,'LineWidth',2); title(['Escalon unitario u(t)'])

pulso='@(t)heaviside(t+1)-heaviside(t-1)';
func_pulso=str2func(pulso);
%y_pulso=func_pulso(2*my_t+3);%1+2*func_pulso(0.5*(my_t-2));   %p(0.5t-1)
y_pulso=func_pulso(0.5*(my_t+2));
subplot(3,1,2)
plot(my_t,y_pulso,'LineWidth',2); title(['Pulso unitario p(0.5t-1)'])

rampa='@(t)heaviside(t-1).*(t-1)';
func_rampa=str2func(rampa);
y_rampa=func_rampa(my_t);
subplot(3,1,3)
plot(my_t,y_rampa,'LineWidth',2); title(['Rampa unitaria r(t)'])

figure(2)
y_escalon_disc=func_esc(my_n);
y_pulso_disc=func_pulso(0.5*(my_n+2));
y_rampa_disc=func_rampa(my_n);
subplot(3,1,1)
stem(my_n,y_escalon_disc,'LineWidth',2); title(['Escalon unitario u(n)'])
subplot(3,1,2)
stem(my_n,y_pulso_disc,'LineWidth',2); title(['Pulso unitario p(0.5(n+2))'])
subplot(3,1,3)
stem(my_n,y_rampa_disc,'LineWidth',2); title(['Rampa unitaria r(n)'])

