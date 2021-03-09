function [x1, x2]=roots2(p, q)
	d = sqrt(p^2/4 - q);
	x1 = -p/2 + d;
	x2 = -p/2 - d;
