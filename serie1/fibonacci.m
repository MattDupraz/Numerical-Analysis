function f = fibonacci(n)
	if n == 0
		f = [0];
	elseif n == 1
		f = [0, 1];
	else
		f = fibonacci(n-1);
		f = [f, f(n-1) + f(n)];
	end
