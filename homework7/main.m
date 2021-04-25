[L, U, x] = algo(10);

disp(x);

B = sparse_matrix(10);
B(1, 1) = -1;
B(10, 10) = -1;
B(1, 10) = 1;
B(10, 1) = 1;

b = ones(10, 1);

rel_error = norm(B*x - b)/norm(b)

for i=2:7
	tic
	algo(10^i);
	toc
end
