% Tus datos originales (pueden variar)
datos = x;

% Calcula el mínimo y el máximo de tus datos
minimo = min(datos);
maximo = max(datos);

% Normaliza los datos al rango de 0 a 255
datos_normalizados = 50 * (datos - minimo) / (maximo - minimo);
B = round(datos_normalizados)
% Ahora, datos_normalizados contendrá tus datos normalizados en el rango de 0 a 255
disp(datos_normalizados);
