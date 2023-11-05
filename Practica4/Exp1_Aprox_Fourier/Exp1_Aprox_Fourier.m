close all;clear all; clc;

%% Señal AC rectificada - Codigo 
%% Aproximación Serie Trigonometrica de Fourier

syms t n
f = 179*abs(sin(2*pi*60*t));

T = 1/120;
w0 = 2*pi/T;
a0 = (1/T)*(int(f,t,-T/2,T/2));
an = (2/T)*(int(f*cos(n*w0*t),t,-T/2,T/2));
bn = (2/T)*(int(f*sin(n*w0*t),t,-T/2,T/2));

%% Aproximacion Simbolica
terminos = 10;
ft = 0;

for nn=1:terminos
    ft = ft + subs(an,n,nn)*subs(cos(n*w0*t),n,nn)+subs(bn,n,nn)*subs(sin(n*w0*t),n,nn);
end

ft = ft + a0;
figure(1)
fplot(t,ft,[-2*T 2*T])
xlabel(['Frecuencia de [Hz]'])
ylabel(['Amplitud'])
%% Aproximación Numerica
% terminos = 10;
% tt=-2*T:0.00001:2*T;
% ft = zeros(1,length(tt));
% 
% for m=1:terminos
%     ft = ft + double(subs(an,n,m)*cos(m*w0*tt)) + double(subs(bn,n,m)*sin(m*w0*tt));
% end
% 
% ft = ft + double(a0);
% figure(2)
% plot(tt,ft)

%% Aproximación Serie Exponencial de Fourier - 
syms n t
f = 179*abs(sin(2*pi*60*t));
T = 1/120;
w0 = 2*pi/T;

cn = (1/T)*int(f*exp(-j*n*w0*t),-T/2,T/2);
%% Simbolica

tot = 20;
ftn = 0;
for nn=-tot:tot
    %if (nn~=1 || nn~=-1)
        ftn = ftn + subs(cn,n,nn)*subs(exp(-j*n*w0*t),n,nn);
    %end
end

figure(3)
fplot(t,ftn,[-2*T 2*T])
xlabel(['Frecuencia de [Hz]'])
ylabel(['Amplitud'])

%% Espectro de Amplitud y de Fase

%Eliminar division / 0
% tot = 30;
% cont = 1;
% for i=-tot:0.1:tot
%     try
%         cn1(cont) = double(subs(cn,n,i));
%     catch
%         cn1(cont) = 0;
%     end
%     cont = cont + 1;
% end

%nn =-tot:0.1:tot;


%Sin contemplar division / 0
nn = -tot:tot;
cn = double(subs(cn,n,nn));


figure(4)
subplot(2,1,1)
stem(nn/(T),abs(cn))
title('Espectro de Amplitud')
xlabel(['Frecuencia en [Hz]'])
set(gca,'FontSize',18)
subplot(2,1,2)
stem(nn/(T),angle(cn)*180/pi)
title('Espectro de Fase')
xlabel(['Frecuencia de [Hz]'])
ylabel(['Fase en [°]'])
set(gca,'FontSize',18)

