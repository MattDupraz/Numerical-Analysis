function []=ex2()
	f = @(x) x.^2./2 .* sin(x);
	l = @(n) linspace(1, 20, n);
	hold on
	plot(l(10), f(l(10)));
	plot(l(20), f(l(20)));
	plot(l(100), f(l(100)));

	

