function [y]=approximate(f, N, z)
	k = @(x, y) exp(-(x-y).^2/2);
	x = (0:N)/N
	K = k(x', x)
	Z = k(z', x)
	y = Z*(K\f(x'));

