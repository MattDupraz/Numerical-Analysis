function x=newton(f, df, x0, tol)
	x=x0;
	n=0;
	while (abs(f(x)) > tol)
		if (df(x0) == 0 || n >= 500)
			x="No convergence";
			break;
		else
			x = x - f(x)/df(x);
			n = n + 1;
		end
	end
