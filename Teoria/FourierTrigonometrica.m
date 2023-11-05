%----------Graficadora de Fourier dada la solución analitica
clear all; close all; clc;

t=-4*pi:1e-4:4*pi;
T=2*pi;
w0 = 2*pi*1/T;

f_t=zeros(size(t));

tot=30; %Numero de términos

for n =-tot:tot
        if n~=0
            f_t=f_t+(j*cos(n*pi)/n)*exp(j*n*w0*t);
        end
end
figure(1)
plot(t,real(f_t))
title(['Aproximación con ',num2str(tot),' terminos'])
set(gca,'FontSize',18)

nn=-tot:tot;
Cn=(j*cos(nn*pi)./nn);

figure(2)
subplot(2,1,1)
stem(nn/(2*pi),abs(Cn))
title('Amplitude Spectrum')
xlabel(['Frequency in [Hz]'])
set(gca,'FontSize',18)
subplot(2,1,2)
stem(nn/(2*pi),angle(Cn)*180/pi)
title('Phase Spectrum')
xlabel(['Frequency in [Hz]'])
ylabel(['Phase in [°]'])
set(gca,'FontSize',18)

