close all;clear all; clc;
syms n t

T=4*pi;     w0=2*pi/T;

a0=(1/T)*(int(-t,t,-2*pi,0)+int(t,t,0,2*pi));
an=(2/T)*(int(-t*cos(n*w0*t),t,-2*pi,0)+int(t*cos(n*w0*t),t,0,2*pi));
bn=(2/T)*(int(-t*sin(n*w0*t),t,-2*pi,0)+int(t*sin(n*w0*t),t,0,2*pi));
disp(['El valor de a0 es: '])
double(a0)
disp(['El valor de an es: '])
pretty(an)
disp(['El valor de bn es: '])
pretty(bn)
%%
 ft=0;
for nn=1:10
 ft=ft+subs(an,n,nn)*subs(cos(n*w0*t),n,nn)+subs(bn,n,nn)*subs(sin(n*w0*t),n,nn);
end
ft=ft+a0;
fplot(t,ft)
%%
%ya se tuvieron las integrales
numTerminos=50
tt=-8*pi:0.01:8*pi;
ftn=zeros(1,length(tt));

for m=1:numTerminos
    ftn=ftn+double(subs(an,n,m)*cos(m*w0*tt))+...
            double(subs(bn,n,m)*sin(m*w0*tt));
end
ftn=ftn+double(a0);
figure
plot(tt,ftn)





% for i=1:numTerminos
%     ftn=ftn+double(subs(an,n,i))*cos(i*w0*tt)+double(subs(bn,n,i))*sin(i*w0*tt)
% end
% ftn=ftn+double(a0);
% figure
% plot(tt,ftn)