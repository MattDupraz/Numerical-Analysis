f = @(x) sin(x) + x;

ev_xs = linspace(-1, 1, 1000);

subplot(2, 1, 1);

% Plot Lebesgue constant for equidistant nodes
L = zeros([15, 1]);

for n=1:15
	xs = cheb(n);
	L(n) = max(lebesgue(ev_xs, xs));
end

semilogy(1:15, L);
hold on;

% Plot Lebesgue constant for Chebyshev nodes
L = zeros([15, 1]);

for n=1:15
	xs = linspace(-1, 1, n+1);
	L(n) = max(lebesgue(ev_xs, xs));
end

semilogy(1:15, L);

subplot(2, 2, 3);

ev_xs = linspace(0, 10, 1000);
ys = f(ev_xs);
%plot(ev_xs, ys);
hold on;

for n = [4, 10]
	eps = 0.1 * rand(1, n + 1);
	xs = linspace(0, 10, n+1);
	ys_tilde = f(xs) + eps;
	inter_ys = interpol(ev_xs, ys_tilde, xs);
	plot(ev_xs, abs(ys - inter_ys));
end

subplot(2, 2, 4);

%plot(ev_xs, ys);
hold on;

for n = [4, 10]
	eps = 0.1 * rand(1, n + 1);
	xs = 5 * (1 + cheb(n));
	ys_tilde = f(xs) + eps;
	inter_ys = interpol(ev_xs, ys_tilde, xs);
	plot(ev_xs, abs(ys - inter_ys));
end
