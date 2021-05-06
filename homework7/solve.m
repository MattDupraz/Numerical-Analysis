function [x, t, B, b] = solve(n)
    %Initialize matrix B
    A = sparse_matrix(n);
    u = sparse([1, n], [1, 1], [1, 1]);
    v = u;
    B = A + u*v';
    b = ones(n, 1);

    tic;
    % Since A is tridiagonal, we can compute y and z with linear complexity
    y = A\u;
    z = A\b;
    x = z - 1/(1 + v' * y) * y * v' * z;
    t = toc;
end