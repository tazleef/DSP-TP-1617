%Tajwar Abrar Aleef, MaIa
function x=dirac(N, n) %Defining New function for Dirac Function
if ((n<1)||(n>N))  %if statement to check if the input of 'n' is in the range or not
     disp('Warning n is not in the range of 1 to N');
     x=0;
     return %if 'n' is not in range, it shows a warning and returns 0
else
     x=zeros(N); 
     x(n)=1;  %if 'n' is in the range, this function returns 0 for every value of N and 1 at x(n) which corresponds to a dirac function  
 end