function y=myexp(x)
	n = 0;
	p = 1;
	y = p;
	while(p/y > 10^(-16))
		n = n + 1;
		p = x ^ n / factorial(n);
		y = y + p;
		v(n) = y;
	end
	semilogy(abs(v - exp(x)));

