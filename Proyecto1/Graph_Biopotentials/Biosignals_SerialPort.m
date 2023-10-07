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
s = serial('COM6'); % Reemplaza 'COM3' con el puerto COM al que está conectado tu Arduino
set(s, 'BaudRate', 9600);
fopen(s);

figure;

while ishandle(1) % Mientras la figura esté abierta en MATLAB
    valor = fscanf(s, '%s'); % Leer el código desde Arduino como cadena
    
    if strcmp(valor, '1') % Si Arduino envía '1'
            
        t = 0:ts:10-ts;
        limitefinal = 5;
        limiteinicial = 0;
        figure(1)
        for i=1:9:2570
            plot(t(1:i),Arritmia(1:i))
            if t(i) < limitefinal
                axis([limiteinicial limitefinal 984 1499])
            else
                limitefinal = limitefinal + 5;
                limiteinicial = limiteinicial + 5;
            end
            pause(ts);
            
        end
        valor = fscanf(s, '%s'); % Leer el código desde Arduino como cadena
            
        
    elseif strcmp(valor, '2') % Si Arduino envía '2'
        t2 = 0:ts2:10-ts2;
        limitefinal = 5;
        limiteinicial = 0;
        figure(2)
        for i=1:6:2500
            plot(t2(1:i),BIH(1:i))
            if t2(i) < limitefinal
                axis([limiteinicial limitefinal -293 124])
            else
                limitefinal = limitefinal + 5;
                limiteinicial = limiteinicial + 5;
            end
            pause(ts2/10);
        end
        

    elseif strcmp(valor, '3') % Si Arduino envía '3'
        t3 = 0:ts3:10-ts3;
        limitefinal = 5;
        limiteinicial = 0;
        figure(3)
        for i=1:50:20000
            plot(t3(1:i),PCG(1:i))
            if t3(i) < limitefinal
                axis([limiteinicial limitefinal -29715 26940])
            else
                limitefinal = limitefinal + 5;
                limiteinicial = limiteinicial + 5;
            end
            pause(ts3/10);
        end
    else
        disp(['Código no reconocido: ', valor]);
    end
    
    pause(0.5); % Pequeña pausa para evitar la saturación del puerto serial
end

fclose(s);
delete(s);

