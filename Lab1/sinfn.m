%Tajwar Abrar Aleef, MaIa
function [x,k]=sinfn(f, fs, p)
    
    T=1/f; %calculating the period of the frequency given of the sin signal 
    Ts=1/fs; %calculating the period of the sampling frequency 
    k=(0:Ts:T*p); %setting discrete range from 0 to T times the period in steps of Ts
    
    x=sin(2*pi*f*k); 
    
end