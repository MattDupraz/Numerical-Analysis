function f=fiboquots(n)
	f = fibonacci(n);
	f = f(3:n+1) ./ f(2:n);
