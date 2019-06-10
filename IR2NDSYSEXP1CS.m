%
%% Program to find the time response of a second order system.
%%
clc;
clear all;
close all;

N = [0  0  4]; %Coeff.of numerator
D = [1  1  4]; %Coeff.of denominator
sys=tf(N,D)%Generating Transfer function
printsys(N,D)
Wn=2;
z=0.25;
Wd=Wn*sqrt(1-z^2);
phi=atan(sqrt(1-z^2)/z);
Mp=exp(-pi*z/sqrt(1-z^2))*100
Td=(1+0.7*z)/Wd
Tr=(pi-phi)*Wd
Tp=pi/Wd
Ts1=4/(z*Wn)
Ts2=3/(z*Wn)
figure('Name','Pranshul')
t=0:0.1:12;
r=t./t;
c=1-((exp(-z.*Wn.*t))/sqrt(1-z^2)).*sin(Wn.*t+phi);
t1=1.05*r;
t2=0.95*r;
plot(t,r,t,c);
hold on
plot(t,t1,'k');
plot(t,t2,'k');
stepinfo(c,t)
xlabel('Time')
ylabel('Amplitude')
title('Step response for second order system')
