%lab 4
clc;
clear all;
close all;
clear all;

%Answer to 1.1
%Computing DFT of a sine wave
f = 5; fs = 50;
t = 0: 1/fs : 1-1/fs;
xn = sin(2*pi*f*t);
N = length(xn);
fr = (-N/2 : N/2-1)*fs/N;
xf = fftshift(fft(xn));
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

%Answer to 1.2
%Computing the DFT of a cosine wave
xn = cos(2*pi*f*t);
xf = fftshift(fft(xn));
figure;
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

%From the output results it can be seen that cosine wave has only a phase
%shift when compared to the sine wave. This means the magnitude is same so
%the magnitude sprectrum has no difference. But when looking at the real
%and imaginary component of the DFT signal, its different due to the phase
%shift

%Answer to 1.3

xn = square(2*f*t);

x = fftshift(fft(xn));
figure;
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(x)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(x)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(x)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

%for box signal, as input is not a perfect box signal, the output magnitude response looks a
%bit different than a sinc function. We know for a DFT-ed box signal the
%ooutput is a sinc function.

%Answer to 1.4

xn=wgn(10000,1,0);
figure;
plot(xn);
N = length(xn);
time=1:N;
fr = (-N/2 : N/2-1)*fs/N;
x = fftshift(fft(xn));
subplot(221); plot(time, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(x)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(x)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(x)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

%Answer to 2.1-2.4

f1 = 5 ; f2 = 20;
fs = [10; 20; 25; 40; 50; 100; 150]; 

for i=1:length(fs)
    N=fs(i);
    n=1:N;
    x=3*cos(2*pi*f1/fs(i)*n)+4*sin(2*pi*f2/fs(i)*n);
    figure;
    subplot(211);
    stem(n,x);
    title(['For sample, fs =' num2str(fs(i))]);
    ylabel('Amplitude'); 
    xlabel('Time'); 
 
    fr = (-N/2 : N/2-1)*fs(i)/N;
    x = ifftshift(fft(x));
    subplot(212);
    plot(fr, abs(x)); 
    title(['Xf for fs= ' num2str(fs(i))]);
    ylabel('X(f)');
    xlabel('Frequency'); 

end

%here according to Nyquist theorem, the sampling frequency must be two times greater than the maximum frequency 
%in the signal to obtain alias free image. Hence for the fs lower than 50, the sampling frequency is less than 
%the maximun frequency of f2=20. Hence from the frequency sprectrum for the
%images for sample frequency 10,20,25 and 40 the magnitude spectrum shows
%only the 5 freuency component of the signal. This means the f2/20Hz signal
%is lost when sampling without following the Nyquist Theorem. For the
%sampling frequency of 50, 100,150, it is seen that the 20Hz frequency
%component is present in the frequency spectrum. Also from the output it
%can be seen that higher the sampling frequency, more of the original
%signal is recovered.