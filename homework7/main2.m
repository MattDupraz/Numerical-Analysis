t = zeros(1, 6);
for i = 2:7
	n = 10^i;
	A = sparse_matrix(n);
	u = sparse([1, n], [1, 1], [1, 1]);
	v = u;
	B = A + u*v';
	b = ones(n, 1);

	tic;
	y = A\u;
	z = A\b;
	x = z - 1/(1 + v' * y) * y * v' * z;
	t(i-1) = toc;
end

loglog(10.^(2:7), t);
ylabel('Time in seconds');
xlabel('n');
grid on;
