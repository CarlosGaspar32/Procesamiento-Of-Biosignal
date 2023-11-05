clear;clc;close all;
%SEÑAL 1
Arritmia = load("I01m.mat");
Arritmia = Arritmia.val;fs = 257;
ts = 1/fs;

%SEÑAL 2
BIH = load('418m.mat');
BIH = BIH.val(1,:);
fs2 = 250;
ts2 = 1/fs2;

%SEÑAL 3
PCG = load("f0001m.mat");
PCG = PCG.val;
fs3 = 2000;
ts3 = 1/fs3;

k = '1';

% Eliminar puerto anterior 
delete(instrfind({'Port'},{'COM6'}));
s = serialport("COM6",9600); % Reemplaza 'COM3' con el puerto COM al que está conectado tu Arduino
fopen(s);

while(1)
    a = read(s,20,"uint8");
    disp(a)
end

