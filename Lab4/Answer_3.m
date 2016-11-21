%lab 4
clc;
close all;
clear all;

% Answer to 3
image_folder='C:\Users\Tajwar Abrar Aleef\Documents\GitHub\DSP-TP-1617\Lab4\images\1D-DFT\'; 
cd (image_folder)
files=dir;
amount_of_images=length(files)-2; 
 for i = 1:amount_of_images
     cell{i} = imread(files(i+2).name); %Loading the all images from the diretory and saving it to a cell 
 end
 
[y,x] = size(cell{1}); %storing the size of the first index image 
 for idx = 2:amount_of_images
     [a,b]=size(cell{idx}) %Comparing the size of all the images in the directory and saving the lowest size in x and y
     if a*b<x*y
     y=a;
     x=b;
     end
 end
 
 p=1;q=1;
 for i=1:amount_of_images
    I = imread(files(i+2).name);
    I = double(I);
    [a,b,c]= size(I); %loading the size of the image in a,b and c
        if c==4 %checking if the tif is 4 dimensional or not
            I=I(:,:,1); %if four dimension then making it 1.
        end
    I=I/(max(I(:)));  %normalizing the image
    I_resized = imresize(I, [y x]); %resizing the image to the lowest size 
    z=round(y/2); %taking the middle row of the image
    Profile_1D =I_resized(z,:); %storing the z row into a new matrix

    N=x;
    fr = (-N/2 : N/2-1);
    x1 = ifftshift(fft(Profile_1D)); 
    %Using DFt transfrom on the 1d Profile
    %Since bar code images has vertical black and white lines, so other
    %rows of the image should have a similar frequency spectrum. Hence two
    %more 1D profile is taken two rows up and down from the middle row.
    
    %Hence calculating DFT of the two other 1D profiles
    Profile_1D2 = I_resized(z+2,:);
    Profile_1D3 = I_resized(z-2,:); 
    x2 = ifftshift(fft(Profile_1D2));
    x3 = ifftshift(fft(Profile_1D3));
    
    %Finding the absolute values of each one 1D profile  
    v1=abs(x1);
    v2=abs(x2);
    v3=abs(x3);
    %taking maximum values of each 1D profile
    threshold1=max(v1);
    threshold2=abs(2*max(v1)-max(v2)-max(v3)); %storing the difference of the three 1D profiles maximum value 
    threshold(i) = threshold1*threshold2; %Taking the multiplication of the two thresholds and creating an offset

    if (threshold(i)<48) %According to the threshold seen at the output,from obeservation a threshold less 
                         %than 48 gives the highest percentage of Barcode Image
        Barcode_image(p)=i ; %If image is barcode, the index of the image is stored 
        p=p+1; 
    else
        NonBarcode_image(q)=i; %If image is barcode, the index of the image is stored
        q=q+1;
    end
 end
 figure;
 stem(threshold); %showing the threshold of each image in one graph
 disp('Barcode');
 disp(Barcode_image); 
 disp('Non barcode');
 disp(NonBarcode_image); %displaying the images that are barcode and the ones nonbarcode
 Barcode=[1,2,6,44:54]; 
 NonBarcode = [3,4,5,7:43];
 
 %Looking for the images that are wrongly classified
 x=length(Barcode);
 u=0;v=0;
 for i=1:length(Barcode)
   for j=1:length(Barcode_image)
     if Barcode_image(j)==Barcode(i)
         u=u+1;
     end
   end
 end
 
 for i=1:length(NonBarcode)
   for j=1:length(Barcode_image)
     if Barcode_image(j)==NonBarcode(i)
         v=v+1;
     end
   end
 end
 %storing the wrong images in v
 v=v+x-u;
 
 %Calculating the percentage of accuracy
 percentage_of_accuracy= ((amount_of_images-v)/amount_of_images)*100;
 sprintf('Percentage of correct distinction between the Barcode and NonBarcode images is: %d percent', round(percentage_of_accuracy))

         
         
       
 
