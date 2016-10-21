%Tajwar Abrar Aleef, MaIa
function x=ramp(N, n, a)
if ((n<1)||(n>N))  %if statement to check if the input of 'n' is in the range or not
     disp('Warning n is not in the range of 1 to N');
     x=0;
     return %if 'n' is not in range, it shows a warning and returns 0
else
    x=zeros(N);
     
    for i=n:N
        x(i)=(i-n)*a; %the for function puts the value of x(i) to (i-n) times the a for 
                      %the range of values from n-N, because the ramp function starts from 
                      %zero and increases by 1 for each step. And the rest of the values of 
                      %x are zero which in together corresponds to a ramp function 
       
    end
end