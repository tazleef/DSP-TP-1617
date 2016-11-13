clc
close all 
clear all 
N=5;
x=[1 2 3 4]; 
%Answer 1.2
%%Checking the convFn function with different signals of h
h=dirac(5,1)
A=convFn(x,h);
figure;
stem(A); 
ylabel('Y[n]'); 
xlabel('n'); 
title('Convolution of Dirac and X');


h=ones(1,N);
y=convFn(x,h);
stem(y); 
ylabel('Y[n]'); 
xlabel('n'); 
title('Convolution of Unitstep and X');


h=exp(1:N);
y=convFn(x,h);
figure;
stem(y);
ylabel('Y[n]'); 
xlabel('n'); 
title('Convolution of Exponential and X');

h=[-1 1];
y=convFn(x,h);
figure;
stem(y);
ylabel('Y[n]'); 
xlabel('n'); 
title('Convolution of H[-1 1] and X');

%%Answer 1.3
%Symmetric Padding

x=[1 2 3 4];
h=unitstep(5,1);
x_mirror=fliplr(x); %storing 4 3 2 1 in x_mirror 
a=length(x);
b=length(h);
c=x(1:b-1); %%storing b-1 elements of x in c which is basically 1 2 3 4 as b-1 here is 4.
X_sym_pad=[fliplr(c),x,x_mirror(1:b-1)] %%padding X with flipped value of X on the right 
                                        %%hand side and also flipped value of the left hand side
y=zeros(1,a+b-1); 
for i=1:a+b-1
    for j=1:b
        y(i)=y(i)+X_sym_pad(b+i-j)*h(j); %using the same equation again for convoluting 
    end
end
figure;
stem(y); 
ylabel('Y[n]'); 
xlabel('n'); 
title('Convolution of Unitstep and symetric padded X');

%Periodic Padding
a=length(x);
b=length(h);
c=fliplr(x(1:b-1)); %storing the flipped value of x in the range of b-1 which is 4 3 2 1

X_sym_pad=[fliplr(c),x,x(1:b-1)] %%padding periodically with 1 2 3 4 in both left and right side 

y=zeros(1,a+b-1);
for i=1:a+b-1
    for j=1:b
        y(i)=y(i)+X_sym_pad(b+i-j)*h(j); %same convolution equation again
    end
end
figure;
stem(y); 
ylabel('Y[n]'); 
xlabel('n'); 
title('Convolution of Unitstep and periodic padded X');


%constant padding
a=length(x);
b=length(h);
c=ones(1,b-1) %storing 1 with length of b-1 in c

X_sym_pad=[5*c,x,5*c] % padding with constant 5 on both left and right side of the X

y=zeros(1,a+b-1);
for i=1:a+b-1
    for j=1:b
        y(i)=y(i)+X_sym_pad(b+i-j)*h(j);
    end
end
figure;
stem(y); 
ylabel('Y[n]'); 
xlabel('n'); 
title('Convolution of Unitstep and constant padded X');


