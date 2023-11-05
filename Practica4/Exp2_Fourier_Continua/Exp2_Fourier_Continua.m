%clear;clc
%Triangular 
syms t w

% Grafica función triangulo unitario
t1=-1.5; t2=1.5;
fs=100;
my_t=t1:1/fs:t2;

tri='@(t)(heaviside(t+1).*(t+1))-2*(heaviside(t).*(t))+(heaviside(t-1).*(t-1))';
func_tri = str2func(tri);
gtri=func_tri(my_t);
figure(1)
subplot(3,1,1)
plot(my_t,gtri); title('tri(t)')

%Transformada continua Fourier
w0 = 4*pi;
ww = -w0:0.1:w0;
ftri=str2sym(tri);

Fw = int(ftri*exp(-j*w*t),t,-10,10);
%Fw = int((t+1)*exp(-j*w*t),t,-1,0)+int((-t+1)*exp(-j*w*t),t,0,1);
Fw = simplify(Fw);
Fww = subs(Fw,w,ww);

%Espectro de Amplitud
eA = abs(Fww);
subplot(3,1,2)
plot(ww,eA)

%Espectro de Fase
eF = angle(Fww);
subplot(3,1,3)
plot(ww,eF)

%% Pulso 
pulso='@(t)heaviside(t+1)-heaviside(t-1)';
func_pulso=str2func(pulso);
gpulso=func_pulso(my_t);
figure(2)
subplot(3,1,1)
plot(my_t,gpulso); title('pulso(t)')


%Transformada continua Fourier
fpulso=str2sym(pulso);

Fw = int(fpulso*exp(-j*w*t),t,-1,1);
Fww = subs(Fw,w,ww);

%Espectro de Amplitud

eA = abs(Fww);
subplot(3,1,2)
plot(ww,eA)

%Espectro de Fase
eF = angle(Fww);
subplot(3,1,3)
plot(ww,eF)