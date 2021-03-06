%TAJWAR ALEEF 
%MAIA
--------
% LAB 2
--------------------------------------------------------------------------


%REMINDER 1
f = 1;
fs = 20;
t= 0 : 0.1 : 10;
y1 = sin(2*pi*f*t);
y2 = sin((2*pi*f*t)/fs);


figure(1)
subplot(2,1,1)      
plot(t,y1)
title('CONTINUOUS SINE WAVE')

subplot(2,1,2)      
stem(t,y2)       
title('SAMPLED SINE WAVE')


%% EXERCISE 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

x = Step(10,4);
y = zeros(1,10);

for k = 1 : 9   
    y(k) = x(k)/2 + x(k+1)/2;
end

figure(2);
stem(x);
title('INPUT TO SYSTEM y(k) = x(k)/2 + x(k+1)/2')

figure(3);
stem(y);
title('RESPONSE OF THE SYSTEM y(k) = x(k)/2 + x(k+1)/2')

%COMMENT: THIS SYSTEM IS NOT CAUSAL SINCE THE RESPONSE TO THE SYSTEM
%STARTS FROM AN INDEX PRIOR TO THAT OF THE INPUT SIGNAL.


% 1.2:


for k = 2 : 10   
   y(k) = 2*x(k) + x(k-1)/2;%PROPOSED SYSTEM
end

figure(4);
stem(y);
title('RESPONSE TO THE PROPOSED CAUSAL SYSTEM')

%COMMENT: THIS SYSTEM IS CAUSAL SINCE THE RESPONSE TO THE SYSTEM
%STARTS FROM THE SAME INDEX AS THAT OF THE INPUT SIGNAL.

%% EXERCISE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

S = step(10,4);
y1=zeros(1,10);

for k = 1 : 10   
    y1(k) = sum(S(1:k));
end

t = 1:1:10;

figure(5);
stem(y1);
title('RESPONSE OF PRIM TO STEP FN')

%COMMENT: AS THE GRAPH OF THE RESPONSE OF PRIM TO STEP FN IS DIVERGING,
% WE CAN CLEARLY SEE THAT THE PRIMITIVE OPERATOR IS NOT STABLE IN THIS
% CASE.



%2.2
D = Dirac(10, 4);
y2 = 1:1:10;
for k = 1 : 10   
    y2(k) = sum(D(1:k)) ;
end
figure(6);
stem(y2);
title('RESPONSE OF PRIM TO DIRAC FN');

%COMMENT: AS THE GRAPH OF THE RESPONSE OF PRIM TO STEP FN CONVERGES TO
%A SINGULAR VALUE, WE CAN CLEARLY SEE THAT THE PRIMITIVE OPERATOR IS STABLE 
%IN THIS CASE.

%%%%%%%%%%%%
%2.3
x = Dirac(10,4);
for k = 2 : 10   
    y(k) = x(k) + 2*y(k-1);
end
figure(7);
stem(y);
title('IMPULSE RESPONSE OF y(k) = x(k) + 2*y(k+1)')

%COMMENT: AS THE GRAPH OF THE IMPULSE RESPONSE IS DIVERGING, WE CAN 
%CLEARLY SEE THAT THE SYSTEM IS UNSTABLE IN THIS CASE.

%%%%%%%%%%%%
%2.4
x = Dirac(10, 4);
for k = 2 : 10   
    y(k) = x(k) + y(k-1)/3;
end
figure(8);
stem(y);
title('IMPULSE RESPONSE OF y(k) = x(k) + y(k+1)/3')

%COMMENT: AS THE GRAPH OF THE IMPULSE RESPONSE OF PRIM TO STEP FN IS 
%CONVERGING, WE CAN CLEARLY SEE THAT THE SYSTEM IS STABLE IN THIS CASE.



%% EXERCISE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3.1

xa = [0 0 0 0 1 2 3 4 5 0 0 0 0 0 0 0 0 0 0];
xb = [0 0 0 0 0 0 0 0 0 4 3 2 1 0 0 0 0 0 0];


for k = 2 : 18  
ya(k) = 3*xa(k-1) - 2*xa(k) + xa(k+1);
yb(k) = 3*xb(k-1) - 2*xb(k) + xb(k+1);
end

figure(9);
stem(ya);
title('RESPONSE OF xa TO y(k) = 3*x(k-1) - 2*x(k) + x(k+1)')

figure(10);
stem(yb);
title('RESPONSE OF xb TO y(k) = 3*x(k-1) - 2*x(k) + x(k+1)')



% 3.2

% A SYSTEM WHICH HAS THE FOLLOWING PROPERTY IS AN LTI SYSTEM:
% IF Y(E*Xa+F*Xb) = Y(E*Xa)+ Y(F*Xa); i.e. LINEAR PROPERTY, &
% IF Y(Xa(t-k)) = Y(t-k); i.e. TIME-INVARIANT PROPERTY


%TO PROVE THE LINEAR PROPERTY, WE WILL MULTIPLY THE SYSTEM WITH A CONSTANT
%AND OBSERVE THE OUTPUT

for k = 2 : 18  
ya1(k) = 2* (3*xa(k-1) - 2*xa(k) + xa(k+1) );
end

fprintf('The value of ya1, after multiplying x by 2 is : \n')
disp(ya1);

% WE CAN SEE FROM THE RESULT THAT ya = 2*ya1; THIS MEANS THAT THE LINEAR
% PROPERTY HOLDS FOR THIS SYSTEM.

% NOW, WE SHALL OBSERVE IF  Y(xa+xb) = Y(xa)+ Y(xb)
xc =xa+xb;
for k = 2 : 18  
z(k) =  3*xc(k-1) - 2*xc(k) + xc(k+1);
end

y_sum = ya + yb;

fprintf('The value of z the o/p of c is : \n')
disp(z);

fprintf('The value of y_sum is : \n')
disp(y_sum);

% SINCE y_sum = z AND ya = 2*ya1, WE CAN SEE THAT BOTH THE CONDITIONS FOR 
% LINEARITY HAVE BEEN FULFILLED. 


%3.3



%THE PROPOSED SYSTEM IS: ya1(k) = k*(3*xa(k-1) - 2*xa(k) + (xa(k+1))^2)

for k = 2 : 18  
ya1(k) = k* (3*xa(k-1) - 2*xa(k) + (xa(k+1))^2 );
end

fprintf('The NEW value of ya1, after multiplying x by 2 is : \n')
disp(ya1);

% WE CAN SEE FROM THE RESULT THAT ya =/= 2*ya1; THIS MEANS THAT THE LINEAR
% PROPERTY DOES NOT HOLD FOR THIS SYSTEM.

% NOW, WE SHALL OBSERVE IF  Y(xa+xb) = Y(xa)+ Y(xb) IS TRUE.

xc =xa+xb;
for k = 2 : 18  
z(k) =  k*(3*xc(k-1) - 2*xc(k) + (xc(k+1))^2);
end

for k = 2 : 18  
ya(k) = k*(3*xa(k-1) - 2*xa(k) + (xa(k+1))^2);
yb(k) = k*(3*xb(k-1) - 2*xb(k) + (xb(k+1))^2);
end

y_sum = ya + yb;

fprintf('The NEW value of z the o/p of c is : \n')
disp(z);

fprintf('The NEW value of y_sum is : \n')
disp(y_sum);

% SINCE y_sum =/= z AND ya =/= 2*ya1, WE CAN SEE THAT BOTH THE CONDITIONS FOR 
% LINEARITY HAVE BEEN VIOLATED. 


%FURTHERMORE, WE CAN SEE THAT THE TERM x(n)^2 MAKES THE SYSTEM NON-LINEAR
%AND THE MULTIPLICAITON BY INDEX K MAKES IT TIME VARIANT.
