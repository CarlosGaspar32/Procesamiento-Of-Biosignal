close
id=load('b00m.mat');
x=(id.val)/5;
x = round(x)

Fs=length(x)/10;
t=0:1/Fs:10-(1/Fs);
max(x)
min(x)
plot(t,B)