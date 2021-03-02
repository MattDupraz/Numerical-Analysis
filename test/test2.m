% The program test2.m computes the sum and the product of all
% elements of a matrix as well as the trace if the matrix
% is square.

function [y, p, t] = test2(A)
	[m, n] = size(A);
	y=0;
	p=1;
	t=0;
	for i = 1:m
		if (m == n)
			t = t + A(i, i);
		end
		for j = 1:n
			y = y + A(i, j);
			p = p * A(i, j);
		end
	end

