function z=poly_product(x, y)
	n = size(x)(1);
	w = zeros(n-1, 1);
	z = convolution([x; w], [y; w]);
