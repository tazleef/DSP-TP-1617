function OutSignal = Dirac(N, n)

if n > N || n < 0
    error('n must be +ve number < 20')
end 

OutSignal = zeros(1, N);
OutSignal (n) = 1;

