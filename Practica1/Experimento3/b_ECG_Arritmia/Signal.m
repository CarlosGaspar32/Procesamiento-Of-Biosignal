id=load('231m.mat');
x=(id.val)/1.5;
%Se sabe que el registro es de 10 [s], entonces
A = x(1,1000:2800);

Fs=length(A)/5;
t=0:1/Fs:5-(1/Fs);


figure(1)
subplot(2,1,1)
plot(t,A)