function xs=cheb(n)
	xs = cos(pi .* (2 .* (0:n) + 1) ./ (2*(n + 1)));
end
