%%Answer to 1.1
%%Defining function convFn
function y=convFn(q,w)
a=length(q);
b=length(w);%%getting size of x and h
y=zeros(1,a+b-1); %%initializing y with zeros of the size of length of x and h minus 1
x=[zeros(1,b-1),q,zeros(1,b-1)]; %%zero padding X with the size of h-1
for i=1:a+b-1
    for j=1:b
    y(i)=y(i)+x(b+i-j)*w(j); %%convoluting with zero padded x and h 
    end
end