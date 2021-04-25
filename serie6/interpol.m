function y=interpol(x, ys, xs)

y = 0;
for i=1:size(xs)(2)
	y = y + ys(i).*lagrange(x, i, xs);
end
