function [x]=jacobi(A, b, x)
	D = diag(diag(A));
	x = richardson(A, D, 1, b, x);
