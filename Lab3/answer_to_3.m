close all;
clc;
clear all;

%%Answer 3.1
text=imread('D:\MAIA France\DSP\DSP-TP-1617-master\Lab 3\images\text.png');
a=imread('D:\MAIA France\DSP\DSP-TP-1617-master\Lab 3\images\a.png');
a= imcomplement(a); %converting the black font to white and black background to white  

%applying OTSU thresholding 
otsu_text = graythresh(text);
otsu_a = graythresh(a);

%Converting the OSTU threshold image to binary for both Text and A and
%displaying it
binary_a = im2bw(a,otsu_a);
figure('Name','a.png binarized using Otsu tresholding','NumberTitle','off');
imshow(binary_a);

binary_text = im2bw(text,otsu_text);
figure('Name','a.png binarized using Otsu tresholding','NumberTitle','off');
imshow(binary_text)

%Applying cross correlationg for both the binary images and showing it
correlated_image= xcorr2(im2double(binary_text),im2double(binary_a));
figure('Name','Correlation of binarized images of text and a','NumberTitle','off');
imshow(correlated_image,[]);

[rowMax, columnMax]=find(correlated_image ==max(max(correlated_image))); %finding the indices of the maximum values of the crosscorellated image
figure('Name','Detected letter A encircled in red','NumberTitle','off');
imshow(binary_text, []); 
i=find(rowMax==(max(max(rowMax)))) %finding the indices of the 11th a
rowMax(i)=[];
columnMax(i)=[]; %removing the 11th a to show only first 10 a
hold on;
plot(columnMax-10,rowMax-10, 'ro','MarkerSize',15), %plotting red circles over the detected A.
