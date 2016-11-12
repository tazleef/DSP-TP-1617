%Tajwar Abrar Aleef, MaIa
function x=step(N, n)
if ((n<1)||(n>N))  %if statement to check if the input of 'n' is in the range or not
     disp('Warning n is not in the range of 1 to N');
     x=0;
     return %if 'n' is not in range, it shows a warning and returns 0
else

    x=zeros(N);
     
    for i=n:N
        x(i)=1; %the for function puts the value of x(i) to 1 for the range 
                %of values from n-N and the rest of the values of x are zero 
                %which in together corresponds to a step function 
    end
end