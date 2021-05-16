A = [3 2; 2 6];
b = [2; -8];

[x, n_iter, res] = gradient(A, b, 10^(-8));

subplot(3, 1, 1);
semilogy(0:n_iter, res);

A = gallery('poisson', 32);

f = @(x,y) -(12*x.^2 - 6*x).*y.*(y - 1) - 2*x.^3.*(x - 1);
n = 33;
x = reshape(repmat(1/n:1/n:1-1/n, [n-1 1]), (n-1)^2, 1);
y = repmat((1/n:1/n:1-1/n)', [n-1 1]);
b = f(x,y)/n^2;

[x, n_iter, res] = gradient(A, b, 10^(-8));

subplot(3, 1, 2);
semilogy(0:n_iter, res);

[x, _, _, n_iter, res] = pcg(A, b, 10^(-8), 500);

subplot(3, 1, 3);
semilogy(0:n_iter, res);
