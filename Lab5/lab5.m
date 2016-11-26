%Lab 5 
%Maia Tajwar Abrar Aleef
clc;
clear all;
close all;

%1.1
%Generating an image with one zeros of 301x301 pixels
img = zeros(301,301);
img(100:200, 140:160) = 255; %declaring a region in the center of the image and making it white
figure(1);
imshow(img) %showing final image

%1.2
%Here we are computing FFT of the image with center shift and outputinh
%Magnitude and phase spectrum of image
imgFreq = fftshift(fft2(img));
figure(1);
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

%1.3
img = zeros(301,301);
img(100:200, 140:160) = 255;

%Declaring a new translated version of the first image and computing its
%FFt with shift and displaying its magnitude spectrum and phase spectrum
imgTrans = zeros(301,301);
imgTrans(150:250, 160:180) = 255;
imgFreq = fftshift(fft2(imgTrans));
figure();
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')


%Now rotating the image to 45 degrees and computing its
%FFt with shift and displaying its magnitude spectrum and phase spectrum
imgRot = imrotate(img, 45)
imgFreq = fftshift(fft2(imgRot));
figure();
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')



%Declaring a new another version of the first image and computing its
%FFt with shift and displaying its magnitude spectrum and phase spectrum
img2 = zeros(301,301);
img2(20:120, 140:160) = 255;
img2(180:280, 140:160) = 255;
imgFreq = fftshift(fft2(img2));
figure();
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')


%Declaring a new version of the first image again and computing its
%FFt with shift and displaying its magnitude spectrum and phase spectrum
img3 = zeros(301,301)
img3(100:200, 145:155) = 255
imgFreq = fftshift(fft2(img3));
figure();
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')


%observations are that translated image shows no change in magnitude
%spectrum but has change in phase spectrum. The rotated imaged has change
%in both magnitude and phase spectrum. 

%1.4
Im=0;
N=64;
T=1;
Ts=T/N;
Fs=1/Ts;
df=Fs/N;
Im(N/8:N/4,N/4+1:N/2)=1;
Im(1:N/4,N/2+1:N)=Im;
Im(N/4+1:N/2,:) = Im;
Im(N/2+1:3*N/4,:) = Im(1:N/4,:);
Im(3*N/4+1:N,:) = Im(1:N/4,:);
%Calculating FFt and displaying the magnitude and phase spectrum
imgFreq = fftshift(fft2(Im));
figure();
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

Ifu = imgFreq(N/2+1,:); %taking the values at the middle rows of FFT
Ifv = imgFreq(:,N/2+1); % taking values at the middle column of FFT
fr = (-N/2 : N/2-1);

%Displaying the row and column of If(u,0) and If(0,v) in both magnitude and
%phase
figure; 
subplot(121); 
plot(fr,abs(Ifu));  
title('Magnitude of If(u,0)')
subplot(122); 
plot(fr,angle(Ifu)/pi*180);  
title('Phase of If(u,0)');
figure; 
subplot(121);
plot(fr,abs(Ifv));  
title('Magnitude of f(0,v)');
subplot(122); 
plot(fr,angle(Ifv)/pi*180);  
title('Phase of f(0,v)');

%1.6
%reading and showing Lena image
lena= imread('C:\Users\Tajwar Abrar Aleef\Documents\GitHub\DSP-TP-1617\Lab5\images\lena-grey.bmp')
figure();
imshow(lena)

%Calculating FFT of lena and displaying its magnitude and phase spectrum
imgFreq = fftshift(fft2(lena));
figure();
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')
imgFreq = (fft2(lena));

%Reconstructiong image from the FFT first using magnitude and then phase
magnitude_lena=abs(imgFreq);
phase_lena=angle(imgFreq);
%performing inverse fourier transform to get back the image
ifft_mag=ifftshift(ifft2(magnitude_lena)); 
ifft_phase=ifft2(exp(1i*phase_lena));%using phase the reconstructed image has more information about the edges
figure();
imshow(ifft_mag, []);
title('Recovered Lena from Magnitude');
figure();
imshow(ifft_phase,[]);
title('Recovered Lena from Phase');
 

%1.7

sobel_filter_matrix=[-1 0 1; -2 0 2; -1 0 1];
%determining the size of lena and the sobel filter matrix
image_size = size(lena);
matrix_size = size(sobel_filter_matrix);
%finding the size of the padding required by adding the image size and
%matrix size and substracting 1
padding_size = image_size + matrix_size - 1;


%calculating the DFt of the two matrix
dft_lena = fft2(double(lena), padding_size(1), padding_size(2));
dft_sobel_matrix = fft2(double(sobel_filter_matrix), padding_size(1), padding_size(2));

%fourier space multiplication
multiplied_dft = dft_sobel_matrix.*dft_lena;
inverse_fft = ifft2(multiplied_dft);
%cropping to original size
inverse_fft = inverse_fft(2:size(lena,1)+1, 2:size(lena,2)+1);

figure;
imshow(inverse_fft,[]);%displaying final output
