clear; clc; close all;

% Definir la función simbólica
syms t;
f = t^3; % Tu función simbólica aquí

% Límites de la función
a = -pi; % Límite inferior
b = pi;  % Límite superior

% Crear puntos para la función
step = 0.001;
time = a:step:b;
y = double(subs(f, time));

% Número de repeticiones
num_repeticiones = 5;

% Inicializar variables para unir los puntos de las gráficas con líneas rectas
x_unido = [];
y_unido = [];

% Desplazar y graficar las instancias de la función
for i = 1:num_repeticiones
    x_desplazado = time + (i - 1) * (b - a);
    y_desplazado = double(subs(f, x_desplazado));
    
    % Almacenar puntos para la gráfica continua
    x_unido = [x_unido, x_desplazado];
    y_unido = [y_unido, y_desplazado];
    
    % Unir el máximo de la gráfica anterior con el mínimo de la siguiente
    if i > 1
        [~, idx_max_anterior] = max(y_unido(end-length(y):(end-1))); % Obtener el índice del máximo de la gráfica anterior
        [~, idx_min_actual] = min(y_desplazado(2:end)); % Obtener el índice del mínimo de la gráfica actual
        x_unido = [x_unido(end - length(y) + idx_max_anterior), x_desplazado(1 + idx_min_actual)]; % Agregar puntos para unir
        y_unido = [y_unido(end - length(y) + idx_max_anterior), y_desplazado(1 + idx_min_actual)];
    end
end

% Graficar las gráficas unidas con líneas rectas
plot(x_unido, y_unido, 'b');
grid minor;
xlabel('Tiempo');
ylabel('Amplitud');
title('Función Continua a lo largo de Múltiples Repeticiones');
