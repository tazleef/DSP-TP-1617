function OutSignal = Step(N, n)

if n > N || n < 0
    error('n must be +ve number < 20');
else 

OutSignal = zeros(1, N);
OutSignal (n:N) = 1;

end
end