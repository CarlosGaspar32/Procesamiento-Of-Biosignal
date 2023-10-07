%% GENERACIÓN DE SEÑALES
close all; clear; clc;
%t's y n's
t1=-10; t2=10;
fs=100;
my_t=t1:1/fs:t2;
my_n=t1:1:t2;

%Triangular 
tri='@(t)(heaviside(t+1).*(t+1))-2*(heaviside(t).*(t))+(heaviside(t-1).*(t-1))';
func_tri=str2func(tri);

%Pulso 
pulso='@(t)heaviside(t+1)-heaviside(t-1)';
func_pulso=str2func(pulso);

%Escalon
escalon='@(t)heaviside(t)';
func_esc=str2func(escalon);

%Rampa
rampa='@(t)heaviside(t-1).*(t-1)';
func_rampa=str2func(rampa);

figure(1)

%Incisos
ia=func_tri(my_t);
subplot(3,2,1)
plot(my_t,ia); title('tri(t)')
hold on 

ib=func_pulso(2*(my_t)+3);
subplot(3,2,2)
plot(my_t,ib); title('p(2t+3)')

ic=3*func_tri(0.5*(my_t+1));
subplot(3,2,3)
plot(my_t,ic); title('3tri(0.5(t+1))')

id=func_pulso(0.5*my_t+2)+func_pulso(2*my_t-4);
subplot(3,2,4)
plot(my_t,id); title('p(0.5t+2)+p(2t-4)')

ie=func_rampa(-2*my_t+3);
subplot(3,2,5)
plot(my_t,ie); title('r(-2t+3)')

figure(2)
iff=func_pulso(0.1.*my_n+0.2)+func_pulso(0.4.*my_n-2);
subplot(2,2,1)
stem(my_n,iff); title('p(0.1n+0.2)+p(0.4n-2)')
hold on

ig=5*func_tri(0.2*(my_n+3));
subplot(2,2,2)
stem(my_n,ig); title('5tri(0.2(n+3))')

ih=5*func_tri(0.2*(my_n-5));
subplot(2,2,3)
stem(my_n,ih); title('5tri(0.2*(n-5)')

ii=((-1).^my_n).*5.*func_tri(0.2*(my_n-5));
subplot(2,2,4)
stem(my_n,ii); title('(-1)^n (h(n))')

