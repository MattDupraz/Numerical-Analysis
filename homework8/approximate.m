function [y]=approximate(f, N, z, lambda)
	k = @(x, y) exp(-(x-y).^2/2);
	x = (0:N)/N;
	K = k(x', x);
    K = K + lambda*eye(size(K));
	Z = k(z', x);
	y = Z*(K\f(x'));

