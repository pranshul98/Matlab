%% DSP LAB EXPERIMENT NO.10.
%%
% Name: pranshul singh
%%
% PRN.NO: 16070123072
%%
% Class: IIIrd Year, 2016 - 20


clc; clear all; close all;

%%
% MATLAB Simulations:
%  Considering the discrete time signal x(n)=sin(2*pi*f*n) , for 0<n<30 and f=0.05. 
%  1.Program in MATLAB to plot the upsampled and interpolated the signal x(n) by a factor I=2 .
%  [Useful MATLAB functions: upsample, interp].
%  2.Program in MATLAB to plot the downsampled and decimated the signal x(n) by a factor D=3 .
%  [Useful MATLAB functions: downsample, decimate].
%  3.Program in MATLAB to plot, the signal x(n) sampled by a non-integer factor I/D=3/4. [Useful
%  MATLAB functions: interp, decimate].
%
%%
%
clc;
clear all;
close all;
N=30;
f=0.05;
n=0:N-1;
x=sin(2*pi*f*n);

%% Interpolation by factor I=2
%%
disp('Interpolation by factor I=2');
I=2;
xi=upsample(x,I);
xii=interp(x,I);
figure('name','Interpolation by factor I=2','NumberTitle','off');
subplot(311);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Original Signal');
subplot(312);
stem(0:N*I-1,xi);
xlabel('n');
ylabel('xi(n)');
title('Signal after Upsampling');
subplot(313);
stem(0:N*I-1,xii);
xlabel('n');
ylabel('xii(n)');
title('Signal after Intepolation');

%% Decimation by factor D=3
%%
disp('*** Decimation by factor D=3 ***');
D=3;
xd=downsample(x,D);
xdd=decimate(x,D,3,'fir');
figure('name','Decimation by factor D=3','NumberTitle','off');
subplot(311);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Original Signal');
subplot(312);
stem(0:N/D-1,xd);
xlabel('n');
ylabel('xd(n)');
title('Signal after Downsampling');
subplot(313);
stem(0:N/D-1,xdd);
xlabel('n');
ylabel('xdd(n)');
title('Signal after Decimation');

%% Multirate by non-integer factor I/D=3/4=0.75
%%
disp('*** Multirate by non-integer factor I/D=3/4=0.75 ***');
I=3;
D=4;
xi=interp(x,I);
xid=decimate(xi,D,3,'fir');
figure('name','Multirate by non-integer factor I/D=3/4','NumberTitle','off');
subplot(311);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Original Signal');
subplot(312);
stem(0:N*I-1,xi);
xlabel('n');
ylabel('xi(n)');
title('Signal after Interpolation');
subplot(313);
stem(0:round(N*I/D-1),xid);
xlabel('n');
ylabel('xid(n)');
title('Signal after Decimation');
%%