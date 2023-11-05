%% Espectro Notas musicasles (8vas)
clc;clear all;close;

%% Grabación
Fs = 96000; %Frecuencia maxima aceptada 48,000Hz
nBits = 24; 
nChannels = 1; 
Sound = audiorecorder(Fs,nBits,nChannels);

disp("Begin speaking.")
recDuration = 3;
recordblocking(Sound,recDuration);
disp("End of recording.")
Audio = getaudiodata(Sound)';
subplot(3,1,1)
time = 0:1/Fs:recDuration-(1/Fs);
plot(time,Audio) %% Audio f(t)
title(['Señal de Audio'])
xlabel(['Tiempo [s]'])
ylabel(['Amplitud'])

%% FTT
[vect_freq,esp_amp,esp_fase] = espectros_fourier(Audio,Fs);

% NOTAS A DETECTAR
Do = 261.62;
Re = 293.66;
Mi = 329.62;
Fa = 349.22;
Sol = 391.99;
La = 440;
Si = 493.88;

subplot(3,1,2)
plot(vect_freq(1,650:1818),esp_amp(1,650:1818))
[Amax pos] = max(esp_amp(1,650:1818));
fmax = vect_freq(650+pos);
Nota = 'Fuera de rango';

%2036
a=1;
if (fmax/2 >= 0.98*Do && fmax/2 <= 1.02*Do)
    Nota = 'Do';
    a=2;
elseif (fmax/2 >= 0.98*Re && fmax/2 <= 1.02*Re)
    Nota = 'Re';
    a=2;
elseif (fmax >= 0.98*Mi && fmax <= 1.02*Mi)
    Nota = 'Mi';
elseif (fmax >= 0.98*Fa && fmax <= 1.02*Fa)
    Nota = 'Fa';
elseif (fmax >= 0.98*Sol && fmax <= 1.02*Sol)
    Nota = 'Sol';
elseif (fmax >= 0.98*La && fmax <= 1.02*La)
    Nota = 'La';
elseif (fmax >= 0.98*Si && fmax <= 1.02*Si)
    Nota = 'Si';
end
fprintf('La nota musical es %s',Nota)
title(['Espectro de amplitud unilateral (normalizado): frecuencias de ',num2str(fmax/a),' [Hz]'])
xlabel(['Frecuencia [Hz]'])
ylabel(['Amplitud [V]'])
set(gca,'FontSize',14)
text(fmax/a,Amax/a,Nota)
grid on
subplot(3,1,3)
plot(vect_freq,esp_fase)
title(['Espectro de fase unilateral: frecuencias de ',num2str(fmax/a),' [Hz]'])
xlabel(['Frecuencia [Hz]'])
ylabel(['Fase [rad]'])
set(gca,'FontSize',14)
