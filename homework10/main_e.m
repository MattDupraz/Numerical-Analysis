% Part (d)
A = [2 -1 0; -1 2 -1; 0 -1 2];
b = [1; 0; 1];
[~, n_iter] = pGrad(A, b, @(r) r, 10^(-6));

fprintf("Number of iterations: %g\n", ...
    n_iter);

% Part (e)
A = delsq(numgrid('S', 30));
b = ones(size(A,1),1);

P = speye(size(A));
[~, n_iter, res] = pGrad(A, b, @(r) P\r, 10^(-6));
subplot(1, 3, 1);
semilogy(0:n_iter, res, 'LineWidth', 2);
title('P = I_n');
grid on;
set(gca, 'FontSize', 14);

P = diag(diag(A));
[~, n_iter, res] = pGrad(A, b, @(r) P\r, 10^(-6));
subplot(1, 3, 2);
semilogy(0:n_iter, res, 'LineWidth', 2);
title('P = diag(A)');
grid on;
set(gca, 'FontSize', 14);


L = ichol(A);
[~, n_iter, res] = pGrad(A, b, @(r) L'\(L\r), 10^(-6));
subplot(1, 3, 3);
semilogy(0:n_iter, res, 'LineWidth', 2);
title('P = LL^t')
grid on;
set(gca, 'FontSize', 14);
