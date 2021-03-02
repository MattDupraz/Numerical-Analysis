% This is my first m file.
% It is called test1.m and computes the sum of all elements of a matrix A.
function y = test1(A)
	[m, n] = size(A);
	y = 0;
	for i = 1:m
		for j = 1:n
			y = y + A(i, j);
		end
	end

