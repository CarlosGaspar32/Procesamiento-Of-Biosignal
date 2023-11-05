%% ANÁLITICA B
clc; close;

n = 0:10;
yn = (3/26 - 53/182j)*(1/10 + 7/10j).^n + (3/26 + 53/182j)*(1/10 - 7/10j).^n + 10/13;
subplot(2,1,1)
plot(n,yn), title('Análitica','k');

%% SIMULINK
%save('Datos.mat','out')
load('Datos.mat')
ynSimulink = out.ED_Simulink(:,2);
subplot(2,1,2)
plot(out.ED_Simulink(:,1),ynSimulink','r'),title('Simulink');

MSE = (sum(yn-ynSimulink').^2)/length(yn)
