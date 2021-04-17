f = @(x) sin(x) + x;

L = zeros([15, 1]);

for n=1:15
	xs = linspace(-1, 1, n+1);
	%xs = cheb(n);
	ev_xs = linspace(-1, 1, 1000);
	L(n) = max(lebesgue(ev_xs, xs));
end

semilogy(1:15, L);
hold on;
