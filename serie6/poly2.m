f = @(x) sin(x);

max_n = 200;

cheb = @(n) cos(pi .* (2 .* (0:n) + 1) ./ (2*(n + 1)));
linsp = @(n) linspace(-1, 1, n + 1);

errs1 = poly_err(f, max_n, cheb, 0, 3*pi);
errs2 = poly_err(f, max_n, linsp, 0, 3*pi);

clf;
subplot(1, 2, 1)
semilogy(0:max_n, errs1)
subplot(1, 2, 2)
semilogy(0:max_n, errs2)
