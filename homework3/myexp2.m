function y = myexp2(x)

% Compute m such that abs(x/2^m) <= 1
m = ceil(log2(abs(x)));
z = x/2^m;

% Calculate exp(x/2^m)
y = myexp(z);

% Square m times to obtain exp(x)
for i=1:m
	y = y^2;
end
