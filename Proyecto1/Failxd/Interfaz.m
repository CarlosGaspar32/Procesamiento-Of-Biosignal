clear;clc;close all;

% Eliminar puerto anterior 
delete(instrfind({'Port'},{'COM6'}));
s = serial('COM6'); % Reemplaza 'COM3' con el puerto COM al que está conectado tu Arduino
set(s, 'BaudRate', 9600);
fopen(s);

figure;
title('Datos en Tiempo Real desde Arduino');
data = [];
tiempo = 0;
ts = 0;
while ishandle(1)
    
    new_data = fscanf(s, '%i'); % Lee los datos desde Arduino
    
    if (new_data == -106)
        ts = 100;
    end
    if (new_data == 194)
        ts = 194;
    end
    if (new_data == 9) 
        ts = 100;
    end

    data = [data, new_data]; % Agrega los nuevos datos al vector de datos
    
    tiempo = tiempo + 8*(1/ts);
    tiempo_vector = linspace(0, tiempo, length(data)); % Vector de tiempo
    plot(tiempo_vector,data); % Grafica todos los datos hasta ahora
    axis([0 10 -128 128])
    drawnow;
     
end

fclose(s);
delete(s);