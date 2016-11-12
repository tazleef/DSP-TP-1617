clc
close all 
clear all 
N=5;
 
%Answer 1.2
h=dirac(5,1)
A=convFn(x,h);
figure;
stem(A); %%checking the convFn function with dirac

h=ones(1,N);
y=convFn(x,h);
stem(y); 

h=exp(1:N);
y=convFn(x,h);
figure;
stem(y); 

h=[-1 1];
y=convFn(x,h);
figure;
stem(y); 

%Symmetric Padding
x=[1 2 3 4];
h=unitstep(5,1);
x_mirror=fliplr(x);
a=length(x);
b=length(h);
c=x(1:b-1);

X_sym_pad=[fliplr(c),x,x_mirror(1:b-1)]

y=zeros(1,a+b-1);
for i=1:a+b-1
    for j=1:b
        y(i)=y(i)+X_sym_pad(b+i-j)*h(j);
    end
end
figure;
stem(y); 

%Periodic Padding
a=length(x);
b=length(h);
c=fliplr(x(1:b-1));

X_sym_pad=[fliplr(c),x,x(1:b-1)]

y=zeros(1,a+b-1);
for i=1:a+b-1
    for j=1:b
        y(i)=y(i)+X_sym_pad(b+i-j)*h(j);
    end
end
figure;
stem(y); 

%constant padding
a=length(x);
b=length(h);
c=ones(1,b-1)

X_sym_pad=[5*c,x,5*c]

y=zeros(1,a+b-1);
for i=1:a+b-1
    for j=1:b
        y(i)=y(i)+X_sym_pad(b+i-j)*h(j);
    end
end
figure;
stem(y); 

