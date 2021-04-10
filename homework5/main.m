% Calculate numerically the roots of the polynomials p_n
r_1 = roots([           1,  0])
r_2 = roots([       2,  0, -1])
r_3 = roots([   4,  0, -3,  0])
r_4 = roots([8, 0, -8,  0,  1])

% Compare with explicit formula
r = @(i, n) cos(pi * (2*i + 1)/(2*(n + 1)));
rs = @(n) r((0:n)', n);

xs_1 = rs(0)
xs_2 = rs(1)
xs_3 = rs(2)
xs_4 = rs(3)

% Define quadrature rule
Q = @(f, n) sum(pi/(n + 1)*f(rs(n)));
% MATLAB numerical integration for comparison
w = @(x) 1./sqrt(1 - x.^2);
I = @(f) integral(@(x) f(x).*w(x), -1, 1, 'AbsTol', 1e-16);
% Calculate error in quadrature rule
err = @(f, n) abs(Q(f, n) - I(f));

% Functions we want to integrate
f_1 = @(x) sqrt(abs(x));
f_2 = @(x) cos(pi/2 * x);

% Plot errors on a graph
ns = 1:1000;
errs_1 = arrayfun(@(n) err(f_1, n), ns);
errs_2 = arrayfun(@(n) err(f_2, n), ns);

subplot(2, 1, 1);
loglog(ns, errs_1, 'LineWidth', 2);
xlabel('n');
ylabel('Error')
title('Approximation error for f(x) = sqrt(|x|)');
set(gca, 'FontSize', 14);
grid on;

subplot(2, 1, 2);
loglog(ns, errs_2, 'LineWidth', 2);
xlabel('n');
set(gca, 'FontSize', 14);
ylabel('Error')
title('Approximation error for f(x) = cos(pi/2 * x)');
grid on;