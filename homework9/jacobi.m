function []=jacobi(A, b, x)
	D = diag(diag(A));
	L = tril(A, -1);
	U = triu(A, 1);
	B = -D\(L+U);
	f = D\b;
	for k=1:100
		x = [x, B*x(:,end) + f];
	end
	semilogy(0:100, abs(sum(A*x - b)));
