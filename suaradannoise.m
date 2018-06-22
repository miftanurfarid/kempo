clear all; close all; clc;

addpath(genpath('code'));
%Membaca file suara yang telah direkam
[Y, Fs] = audioread('080308-010.wav');
Y1 = Y(:,1)*10;
derau = randn(length(Y1),1);
Noise = 0.005*derau;
Y_Noise = Y1 + Noise;

hlpf = fdesign.lowpass('N,Fc',10,1000,Fs);
% hlpf = fdesign.lowpass('Fp,Fst,Ap,Ast',0.15,0.25,1,60,Fs);
D = design(hlpf);
estY = filter(D,Y_Noise);

% [esTSNR,esHRNR]=WienerNoiseReduction(Y_Noise,Fs);

% sound(esTSNR,Fs);

%sound(Y, Fs);
%Menambahkan noise pada sinyal suara
%derau = randn(length(Y),1);
%Y_Noise = conv(derau, Y);

%Play Suara
%sound(Y_Noise, Fs);
