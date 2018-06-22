Fs = 12000;
x =wavread('d:/assignment_1/speech_safety_-2db_snr.wav');
% plotting original sound signal
figure(1)
%subplot(2,1,1)
plot(x)
xlabel('time');ylabel('Amplitude');title('Original Sound Signal')
% Specifying the filter
%'Fp,Fst,Ap,Ast' (passband frequency, stopband frequency, passband ripple, stopband attenuation)
hlpf = fdesign.lowpass('Fp,Fst,Ap,Ast',4.0e3,5.5e3,01,50,Fs);
% Designing the filter
D = design(hlpf);
% Applying the filter
y = filter(D,x);
% Getting sound after sampling and Filteration
sound(y,Fs)
% plotting modified sound signal
% noise is removed after filteration
figure(2)
%subplot(2,1,2)
plot(y)
xlabel('time');ylabel('Amplitude');title('modified sound signal')