function l=lagrange(x, i, xs)
	l = 1;
	for j=1:size(xs)(2)
		if j != i
			l = l.*(x - xs(j))/(xs(i) - xs(j));
		end
	end

