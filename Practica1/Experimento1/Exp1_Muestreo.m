close;clc;clear;

%1
fs = 25;
ts = 1/fs;

t = 0:ts:0.1;

x=3*cos(2*pi*50*t);
figure(1)
stem(t,x,'r','MarkerSize',10),title('fs = 50Hz - Periodica - No cumple teorema');
%% 2
fs = 100;
ts = 1/fs;

t = 0:ts:0.1;

x=3*cos(2*pi*50*t);
figure(2)
stem(t,x,'r','MarkerSize',10),title('fs = 100Hz - Periodica - Si cumple teorema');

%% 3
fs = 500;
ts = 1/fs;

t = 0:ts:0.1;

x=3*cos(2*pi*50*t);

figure(3)
stem(t,x,'r','MarkerSize',10),title('fs = 500Hz - Periodica - Si cumple teorema');
%%%
%% 4
fs = 25*sqrt(2);
ts = 1/fs;

t = 0:ts:0.1;

x=3*cos(2*pi*50*t);

figure(4)
stem(t,x,'r','MarkerSize',10),title('fs = 25sqrt(2) Hz - No Periodica - No cumple teorema');

%% 5

fs = 200*pi
ts = 1/fs;

t = 0:ts:0.1;

x=3*cos(2*pi*50*t);
figure(5)

stem(t,x,'r','MarkerSize',10),title('fs = 25sqrt(2) Hz - No Periodica - No cumple teorema');
