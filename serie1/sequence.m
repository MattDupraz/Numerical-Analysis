function x=sequence(n, C)
	x = 2012;
	for i=2:n
		x = 0.5*(x + C/x);
	end
