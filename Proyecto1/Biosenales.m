%% SEÑAL 1: ABP
ABP = load('c00m.mat');
ABP = ABP.val;
% Tus datos originales (pueden variar)
ABP = round(ABP/6); % Normalizar a uint8_t

fs = 125;
ts = 1/fs;

T = 0:ts:(1250*ts)-ts;

plot(T,ABP)
axis([0 2 min(ABP) max(ABP)])
%% SEÑAL 2: 
Arritmia = load('I01m.mat');
Arritmia = Arritmia.val;
% Tus datos originales (pueden variar)
Arritmia = round(Arritmia/6); % Normalizar a uint8_t

fs = 257;
ts = 1/fs;

T = 0:ts:(2570*ts)-ts;

plot(T,Arritmia)
axis([0 2 min(Arritmia) max(Arritmia)])

%% SEÑAL 3 
ECG = load("c002m.mat");
ECG = ECG.val;
% Tus datos originales (pueden variar)
ECG = round(ECG/16); % Normalizar a uint8_t

fs = 125;
ts = 1/fs;

T = 0:ts:(1250*ts)-ts;

plot(T,ECG)
axis([0 2 min(ECG) max(ECG)])

