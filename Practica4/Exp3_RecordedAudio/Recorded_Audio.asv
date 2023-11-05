%% Espectro Notas musicasles (8vas)
clc;clear all;close;

%% Grabación
Fs =  92000; %Frecuencia maxima aceptada 46,000Hz
nBits = 8; 
nChannels = 1; 

Sound = audiorecorder(Fs,nBits,nChannels);

disp("Begin speaking.")
recDuration = 4;
recordblocking(Sound,recDuration);
disp("End of recording.")
Audio = getaudiodata(Sound);
subplot(3,1,1)

time = 0:1/Fs:recDuration-(1/Fs);
plot(time,Audio) %% Audio f(t)
title(['Señal de Audio'])
xlabel(['Tiempo [s]'])
ylabel(['Amplitud'])

%% FTT
[vect_freq,esp_amp,esp_fase] = espectros_fourier(Audio,Fs);

subplot(3,1,2)
plot(vect_freq,esp_amp)
[val pos] = max(esp_amp);
fmax = vect_freq(pos);
title(['Espectro de amplitud unilateral (normalizado): frecuencias de ',num2str(fmax),' [Hz]'])
xlabel(['Frecuencia [Hz]'])
ylabel(['Amplitud [V]'])
set(gca,'FontSize',14)
grid on
subplot(3,1,3)
plot(vect_freq,esp_fase)
title(['Espectro de fase unilateral: frecuencias de ',num2str(fmax),' [Hz]'])
xlabel(['Frecuencia [Hz]'])
ylabel(['Fase [rad]'])
set(gca,'FontSize',14)
