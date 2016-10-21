%Tajwar Abrar Aleef, MaIa
function x=box(N, n, a)
if ((n<1)||(n>N))  %if statement to check if the input of 'n' is in the range or not
     disp('Warning n is not in the range of 1 to N');
     x=0;
     return %if 'n' is not in range, it shows a warning and returns 0   
else

    x=zeros(N);
     
    for i=n-a:n+a
        x(i)=1;  %the for function puts the value of x(i) to 1 for 
                 %the range of values from n-a to n+a, And the rest of the values of 
                 %x are zero which in together corresponds to a box function 
    end
end