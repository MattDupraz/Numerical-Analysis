load matr.mat;

A = [2, -1, 0; -1, 2, -1; 0, -1, 2];
%A = matr;

D = diag(diag(A));
I = speye(size(A));

b = randn(size(A)(1), 1);
x = zeros(size(A)(1), 1);

subplot(1, 3, 1);
jacobi(A, b, x);
title('Jacobi');

subplot(1, 3, 2);
richardson(A, I, 1.9/norm(A, inf), b, x);
title('Richardson, no preconditioner');

subplot(1, 3, 3);
richardson(A, D, 1.9/norm(D\A, inf), b, x);
title('Richardson, diagonal preconditioner');
