function sn = myexp(x)
% Initialize sum at s_0 = 1
n = 0;
sn = 1;
% Add next term in sum, as long as the value of next term is large enough
while sn == 0 || abs(x)^(n+1)/(factorial(n+1) * abs(sn)) > 10^(-16)
	n = n + 1;
	sn = sn + x^n/factorial(n);
end
