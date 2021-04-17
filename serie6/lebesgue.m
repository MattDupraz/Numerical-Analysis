function s=lebesgue(x, xs)
	s = 0;
	for i=1:size(xs)(2)
		s = s + abs(lagrange(x, i, xs));
	end
