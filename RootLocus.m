%A unity gain feedback system has an open loop tranfer function, G(s)H(s)=k/(s(s+2)(s+4)).
%Write a program in MATLAB to plot the ROOT LOCUS of the system.
clc;
clear all;
close all;
char num;
char den;
n1=[1];
u=[1 0];
v=[1 2];
x=[1 4];
w=conv(u,v);
w1=conv(x,w);
sys=tf(n1,w1)
rlocus(sys)
xlim([-6,2])
ylim([-4,4])
sgrid
[k,p]=rlocfind(sys);
[num,den]=cloop(k*n1,w1)
figure('name','pranshul');
step(num,den)