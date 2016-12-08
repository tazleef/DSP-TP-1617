clc;
clear all;
close all;

%Question 1
%ButterWorth Filter
%Low-pass butterworth filter
[x,y] = butter(3,0.5,'low');
[H, W]= freqz(x,y);
figure();
subplot(2,2,1);
plot(W/pi, abs(H)); 
title('Low-Pass Butterworth Filter');

%High-pass butterworth filter
[x,y] = butter(3,0.5, 'high');
[H, W]= freqz(x,y);
subplot(2,2,2);
plot(W/pi, abs(H)); 
title('High-pass Butterworth Filter');

%Band-pass butterworth filter
[x,y] = butter(3,[0.4 0.6]); %pass band between 0.4-0.6
[H, W]= freqz(x,y);
subplot(2,2,3);
plot(W/pi, abs(H));
title('Band-pass Butterworth Filter');

%Band-stop butterworth filter
[x,y] = butter(3,[0.4 0.6] , 'stop'); %stop band between 0.4-0.6
[H, W]= freqz(x,y);
subplot(2,2,4);
plot(W/pi, abs(H));
title('Band-Stop - Butterworth');

%Chebychev-I Filter
%Low-pass Chebychev-I filter
[x,y] = cheby1(3,1,0.5,'low');  
[H, W]= freqz(x,y);
figure();
subplot(2,2,1);
plot(W/pi, abs(H)); 
title('Low-pass Chebychev-I filter');

%High-pass Chebychev-I filter
[x,y] = cheby1(3,1, 0.5, 'high');
[H, W]= freqz(x,y);
subplot(2,2,2);
plot(W/pi, abs(H));
title('High-pass Chebychev-I filter');

%Band-pass Chebychev-I filter
[x,y] = cheby1(3,1, [0.4 0.6]); %pass band between 0.4-0.6
[H, W]= freqz(x,y);
subplot(2,2,3);
plot(W/pi, abs(H));
title('Band-pass Chebychev-I filter');

%Band-stop Chebychev-I filter
[x,y] = cheby1(3,1, [0.4 0.6] , 'stop'); %stop band between 0.4-0.6
[H, W]= freqz(x,y);
subplot(2,2,4);
plot(W/pi, abs(H)); 
title('Band-stop Chebychev-I filter');


%Question 1.2
%With order 3
figure();
[x,y] = cheby1(3,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,1);
plot(W/pi, abs(H));
title('Low-pass Chebyshev-I filter with order 3');

%With order 5
[x,y] = cheby1(5,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,2);
plot(W/pi, abs(H)); 
title('Low-pass Chebyshev-I filter with order 5');

%with order 10
[x,y] = cheby1(10,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,3);
plot(W/pi, abs(H));
title('Low-pass Chebyshev-I filter with order 10');

%with order 20
[x,y] = cheby1(20,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,4);
plot(W/pi, abs(H));
title('Low-pass Chebyshev-I filter with order 20');


%It can be seen that by increasing the order, the gradient of the low pass
%becomes more steep, meaning that it gets close to what we call an ideal
%low pass filter, but then again at the same time the ripple caused by the
%filter increasing with the order number


%Question 2.1
%Calling dirac function previously defined in previous labs
dirac=dirac(40, 20); %dirac with n=20 and N=40
figure();   
plot(dirac); 
title('Dirac Function'); xlabel('k'); ylabel('x(k)');

%Setting value of scaling
scale = 0.5; 
Ts = 1; 
alpha = scale*Ts;  
alpha_signal = exp(-alpha) ;

%Anti-Causal part of smoothing filter
dirac_anticausal_smooth = zeros(length(dirac),1);
dirac_length=length(dirac)-2:-1:1;
for i =  dirac_length 
 dirac_anticausal_smooth(i) = scale*alpha*alpha_signal*dirac(i+1)+(2*alpha_signal)*dirac_anticausal_smooth(i+1)-(alpha_signal^2)*dirac_anticausal_smooth(i+2);
end
figure()
stem (dirac_anticausal_smooth) ;
title('Anti-causal Smoothing'); 

%Causal part of smoothing
dirac_causal_smooth = zeros(length(dirac),1);
for i = 3:length(dirac);
 dirac_causal_smooth(i) = -scale*alpha*alpha_signal*dirac(i-1)+(2*alpha_signal)*dirac_anticausal_smooth(i-1)-(alpha_signal^2)*dirac_anticausal_smooth(i-2);
end    
figure()
stem (dirac_causal_smooth) ;
title('Causal Smmothing'); 

%Step input Signal
step10=step(40,10)
step30=step(40,30)
step=step10-step30;
figure()
stem(step)
%Causal Derivative function
step_causal = zeros(length (step),1) ;
for i = 3 : length(step)
 step_causal(i) = step(i)+alpha_signal*(alpha-1)*step(i-1)+(2*alpha_signal)*step_causal(i-1)-(alpha_signal^2)*step_causal(i-2) ;
end
figure()
stem (step_causal) ;
title('Causal Deravative');

%Anti-causal derivative function
step_anticausal = zeros(length (step),1);
step_length = length(step)-2 : -1 : 1 ; 
for i = step_length  
 step_anticausal(i) = alpha_signal*(alpha+1)*step(i+1)-(alpha_signal^2)*step(i+2)+(2*alpha_signal)*step_anticausal(i+1)-(alpha_signal^2)*step_anticausal(i+2) ;  
end
figure()
stem (step_anticausal);
title('Anti-Causal Deravative');

%Question 3
barbara = imread('C:\Users\Tajwar Abrar Aleef\Documents\GitHub\DSP-TP-1617\Lab6-7\images\barbara.gif');
figure();
imshow(barbara);  
case1 = zeros(size(barbara)); 
case2 = zeros(size(barbara)); 


for i = 1:size(barbara, 2)
    image1 = barbara(:,i);
    
    response_causal = zeros(length (image1),1) ;
    for i = 3 : length(image1)
     response_causal(i) = image1(i)+alpha_signal*(alpha-1)*image1(i - 1)+(2*alpha_signal)*response_causal(i-1)-(alpha_signal^2)*response_causal(i-2) ;
    end
    
    response_antiCausal = zeros(length (image1 ),1) ;
    barbara_length = length(image1)-2 : -1 : 1 ;
    for i =  barbara_length
     response_antiCausal(i) = alpha_signal*(alpha+1)*image1(i+1)-(alpha_signal^2)*image1(i+2)+(2*alpha_signal)*response_antiCausal(i+1)-(alpha_signal^2)*response_antiCausal(i+2) ;
    end
    
    response = response_causal + response_antiCausal;
    
    case1(:,i) = response;            
end
figure();
imshow (case1, []);

for i = 1:size(barbara, 2)

    image2 = barbara(i,:);
    
    response_causal = zeros(length (image2),1) ;
    for i = 3 : length(image2)
     response_causal(i) = image2(i)+alpha_signal*(alpha-1)*image2(i - 1)+(2*alpha_signal)*response_causal(i-1)-(alpha_signal^2)*response_causal(i-2) ;
    end
    
    response_antiCausal = zeros(length (image2 ),1) ;
    barbara_length = length(image2)-2 : -1 : 1 ;
    for i =  barbara_length
     response_antiCausal(i) = alpha_signal*(alpha+1)*image2(i+1)-(alpha_signal^2)*image2(i+2)+(2*alpha_signal)*response_antiCausal(i+1)-(alpha_signal^2)*response_antiCausal(i+2) ;
    end
    response2 = response_causal + response_antiCausal;
    
    case2(i,:) = response2;   
end
figure();
imshow (case2, []);


