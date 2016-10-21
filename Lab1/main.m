%Tajwar Abrar Aleef, MaIa
clc;
close all;
clear all;
N=20;
n=10;
a=1; %declaring default values

%Answer to 1.1

y=dirac(20,10); %calling the dirac function with the values of N and n
x=linspace(1,N,N); %defining the x axis in the range of N 

figure;
stem(x,y); %displaying the graph
title('Dirac Function');
xlabel('N');
ylabel('dirac(N-n)');


%Answer to 1.2

y=step(20,10); %calling the step function with the values of N and n
x=linspace(1,N,N); %defining the x axis in the range of N 

figure;
stem(x,y);
title('Step Function');
xlabel('N');
ylabel('step(N-n)');

%Answer to 1.3

y=ramp(20,10,2); %calling the ramp function with the values of N, n and a
x=linspace(1,N,N); %defining the x axis in the range of N 

figure;
stem(x,y);
title('Ramp Function');
xlabel('N');
ylabel('ramp(N-n)');

%Answer to 1.4

y=geo(20,10,2); %calling the geo function with the values of N, n and a
x=linspace(1,N,N); %defining the x axis in the range of N 

figure;
stem(x,y);
title('Geometric Function');
xlabel('N');
ylabel('geo(N-n)');

%Answer to 1.5

y=box(20,10,3); %calling the box function with the values of N, n and a
x=linspace(1,N,N); %defining the x axis in the range of N 

figure;
stem(x,y);
title('Box Function');
xlabel('n');
ylabel('Box(N-n)');

%Answer to 1.6

[y,x]=sinfn(10,100,1) %calling the sinfn function with the values of f,fs and period
figure;
stem(x,y);
title('Sinfn Function');
xlabel('n');
ylabel('sin(2?fnTs)');

[y,x]=sinfn(10,1000,2) %calling the sinfn function with the values of f,fs and period
figure;
stem(x,y);
title('Sinfn Function');
xlabel('n');
ylabel('sin(2?fnTs)');

[y,x]=sinfn(10,30,2) %calling the sinfn function with the values of f,fs and period
figure;
stem(x,y);
title('Sinfn Function');
xlabel('n');
ylabel('sin(2?fnTs)');

%Answer to 2.1

Xn_1000 = randn(1000,1); %Generating observation of 1000 random process
figure;
histfit(Xn_1000); %histfit function shows histogram with the Xn distribution as well as the normal random process in red
title('Distribution of Xn with Normal distribution');
legend('Xn','Normal Distribution');


Xn_10000 = randn(10000,1); %Generating observation of 10000 random process
figure;
histfit(Xn_10000); %histfit function shows histogram with the Xn distribution as well as the normal random process in red
title('Distribution of Xn with Normal distribution');
legend('Xn','Normal Distribution');

%Answer to 2.2

Xu_1000 = rand(1000,1); %Generating observation of 1000 random process
figure;
hist(Xu_1000); %hist function shows histogram with the Xu distribution
title('Distribution of Xu');


Xu_10000 = rand(10000,1); %Generating observation of 10000 random process
figure;
hist(Xu_10000); %hist function shows histogram with the Xu distribution
title('Distribution of Xu');

%Answer to 2.3

figure;
autocorrXn_1000 = xcorr(Xn_1000);
plot(autocorrXn_1000)
title('Autocorrelation of Xn with 1000 samples')

figure;
autocorrXn_10000 = xcorr(Xn_10000);
plot(autocorrXn_10000)
title('Autocorrelation of Xn with 10000 samples')

figure;
autocorrXu_1000 = xcorr(Xu_1000);
plot(autocorrXu_1000)
title('Autocorrelation of Xu with 1000 samples')

figure;
autocorrXu_10000 = xcorr(Xu_10000);
plot(autocorrXu_10000)
title('Autocorrelation of Xu with 10000 samples')

%The definition as taken from wikipedia states that in discrete time, white noise is a discrete signal whose samples are regarded 
%as a sequence of serially uncorrelated random variables with zero mean and finite 
%variance; a single realization of white noise is a random shock. Depending on the 
%context, one may also require that the samples be independent and have identical 
%probability distribution (in other words i.i.d. is a simplest representative of 
%the white noise). In particular, if each sample has a normal distribution with 
%zero mean, the signal is said to be Gaussian white noise. As first one Xn
%has amean of around zero so its a white noise while Xu doesnt have a mean
%of zero so its not a white noise

%Answer to 2.4

%generating binary random signals for s1,s2,s3

s1=round(rand(1,50));
s2=round(rand(1,50));
s3=round(rand(1,50)); 

%joining the signals and storing to s at different shifts

s(1:50)=s1;
s(101:150)=s2;
s(201:250)=s3;

%Calculating and showing plot of cross-correlation 
s1corr=xcorr(s,s1); 
figure;
plot(s1corr);
title('Cross Correlation between S1 and S');

s2corr=xcorr(s,s2); 
figure;
plot(s2corr);
title('Cross Correlation between S2 and S');

s3corr=xcorr(s,s3); 
figure;
plot(s3corr);
title('Cross Correlation between S3 and S');

%showing the whole signals    
figure;
plot(s);
title('Whole signal s');
