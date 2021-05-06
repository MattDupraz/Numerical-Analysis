x = algo(10);

disp(x);

B = sparse_matrix(10);
B(1, 1) = -1;
B(10, 10) = -1;
B(1, 10) = 1;
B(10, 1) = 1;

b = ones(10, 1);

rel_error = norm(B*x - b)/norm(b)

t = zeros(6);
for i=2:7
	tic
    
    n = 10^i;
	x = algo(n);
    
	t(i-1) = toc;
end

loglog(10.^(2:7), t);
ylabel('Time in seconds');
xlabel('n');
grid on;
