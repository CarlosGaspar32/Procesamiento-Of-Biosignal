clc;clear;
ECG = load('ecg_pink_noise_250Hz.txt');
SENO = load('seno10Hz_pink_noise_250Hz.txt');
h1 = load('h1.txt');
h2 = load('h2.txt');

fs = 250;
ts = 1/fs;

convECG = conv(ECG,h1);
convSENO = conv(SENO,h2);
figure(1)
subplot(3,1,1)
tECG = 0:ts:(2511)*ts-ts;

plot(tECG,convECG),axis([0 10 min(convECG) max(convECG)]),title("ENTRADA Y SALIDA ECG")
hold on
TECG = 0:ts:(2500)*ts-ts;
plot(TECG,ECG)
subplot(3,1,2)
plot(tECG,convECG),axis([0 10 min(convECG) max(convECG)]), title("SALIDA ECG")
subplot(3,1,3)
plot(TECG,ECG), title("ENTRADA ECG")
%% 
figure(2)
subplot(3,1,1)
tSENO = 0:ts:(514)*ts-ts;
plot(tSENO,convSENO),axis([0 2 min(convSENO) max(convSENO)]),title("ENTRADA Y SALIDA SENO")
hold on
TSENO = 0:ts:(501)*ts-ts;
plot(TSENO,SENO)
subplot(3,1,2)
plot(tSENO,convSENO),axis([0 2 min(convSENO) max(convSENO)]),title("SALIDA ECG")
subplot(3,1,3)
plot(TSENO,SENO),title("ENTRADA ECG")