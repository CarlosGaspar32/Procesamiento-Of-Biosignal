%% Filtro IIR Pass Band  *
  %Fs = 2000;
  %Flow = 95
  %FHigh = 105Hz
x_n = 0; %Entrada
y_n = 0; %Salida
x_1 = 0, x_2 = 0, x_3 = 0, x_4 = 0, x_5 = 0, y_1 = 0, y_2 = 0, y_3 = 0, y_4 = 0, y_5 = 0;
a1 = 0.000241359049042, a2 = 0,a3 = -0.0004827180980839,a4=0,a5 = 0.000241359049042;
b2 = -3.76244262437639, b3 = 5.49499900136064, b4 = -3.67977358644584, b5 = 0.956543676511202;

val_snr = 18;% Ruido

t = 0:1/(20*100):(1/100)*5;
sign = 5*sin(2*pi*100*t);
sign_total = awgn(sign,val_snr,'measured');
subplot(3,1,1)
plot(t,sign_total)
%% Filtro Digital 

    x_n = sign_total;
    %Ecuacion en diferencias
    for i = 1: length(x_n)
        y_n(i) = x_n(i)*a1 + x_1*a2 + x_2*a3 + x_3*a4 + x_4*a5 - y_1*b2 - y_2*b3 - y_3*b4 - y_4*b5;

        %Corrimiento
        y_4 = y_3;
        y_3 = y_2;
        y_2 = y_3;
        y_1 = y_n(i);
        x_4 = x_3;
        x_3 = x_2;
        x_2 = x_1;
        x_1 = x_n(i);
    end
    %y_n = y_n & 255;
    %Serial.println(y_n);
    %pause(1/(20*100));
%% FILTRO DIGITAL 97 Hz - 103 Hz - Chevyshef

% Definir coeficientes del filtro
G = 0.00188587567476135;
% Numerador
a1 = 1*G;
a2 = 0*G;
a3 = -1*G;
% Denominador
b1 = 1;
b2 = -1.99229268756101;
b3 = 0.996228248650477;


% Definir señal de entrada
val_snr = 17;
fs = 10000;
ts=1/fs;
t = 0:ts:(1/100)*25;
x_n = 1024*sin(2*pi*96*t);
x_n_noisy = awgn(x_n, val_snr, 'measured');

% Inicializar variables
y_1 = 0; y_2 = 0;
x_1 = 0; x_2 = 0;

% Filtrar la señal de entrada
for i = 1:length(x_n_noisy)
    y_n(i) = x_n_noisy(i)*a1 + x_1*a2 + x_2*a3 - y_1*b2 - y_2*b3;

    % Actualizar historial de salidas y entradas
    y_2 = y_1; y_1 = y_n(i);
    x_2 = x_1; x_1 = x_n_noisy(i);
end


% Graficar señales de entrada y salida
subplot(3,1,1);
plot(t, x_n_noisy);
hold on;
subplot(3,1,2);
plot(t, y_n);
hold off;


