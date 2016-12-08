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





