clc;
close all;
clear all;

Image=imread('D:\MAIA France\DSP\DSP-TP-1617-master\Lab 3\images\lena-grey.bmp');  
figure;
imshow(Image,[]);
title('Original Image');
%%Answer to 2.2  
Gaussian_kernel=(1/256)*[1 4 6 4 1;
              4 16 24 16 4;
              6 24 36 24 6;
              4 16 24 16 4;
              1 4 6 4 1];
%%Convolution of image with the gaussian kernel
Convoluted_Gaussian =convolve2d(Image,Gaussian_kernel);
figure;
imshow(Convoluted_Gaussian,[]);
title('Smoothing of lena using Gaussian Kernel');

%%Answer to 2.3
%Sobel x and y filter
Xfilter = [-1 0 1; -2 0 2; -1 0 1];
Yfilter= [1 2 1; 0 0 0; -1 -2 -1];

%Convolving Image with the two filters
Image_FilterX=convolve2d(Image,Xfilter);
Image_FilterY=convolve2d(Image,Yfilter);

Final_Sobel_Edge = sqrt((Image_FilterX.*Image_FilterX) + (Image_FilterY.*Image_FilterY));
figure, 
imshow(Final_Sobel_Edge, []);
title('Transformed with Sobel filtering')
 