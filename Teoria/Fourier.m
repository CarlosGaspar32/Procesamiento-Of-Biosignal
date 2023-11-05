% Definir el tiempo (por ejemplo, de 0 a 1 segundo con paso de 0.001 segundos)
t = 0:0.001:1;

% Calcular la señal
f = 179 *abs(sin(2*pi*60*t));

% Calcular el espectro de amplitud usando la transformada de Fourier
espectro_amplitud = abs(fft(f));
espectro_amplitud = espectro_amplitud / length(espectro_amplitud);
% Calcular las frecuencias correspondientes
frecuencias = linspace(0, 1/(2*(t(2)-t(1))), length(t)/2 + 1);

% Graficar el espectro de amplitud
plot(frecuencias, espectro_amplitud(1:length(frecuencias)));
title('Espectro de Amplitud');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
grid on;
