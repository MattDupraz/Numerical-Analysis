function Q=my_quad(f, a, b, N)
	h = (b - a)/N;
	% vector containing midpoints of each interval
	xs = linspace(a + h/2, b - h/2, N);
	% evaluation of f at points corresponding to the quadrature rule
	f1 = f(xs - h/(2*sqrt(3)));
	f2 = f(xs + h/(2*sqrt(3)));
	% sum and weighing with respect to the size of intervals
	Q = sum(f1 + f2) * h/2;
end


