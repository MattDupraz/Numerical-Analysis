function [ElProd, ScalProd, v] = operations(x, y)
	ElProd = x .* y;
	ScalProd = dot(x, y);
	v = x .* flip(y);
