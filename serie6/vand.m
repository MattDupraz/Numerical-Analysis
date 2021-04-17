f = @(x) 1./(1 + 9*x.^2)
%f = @(x) sin(x)

k = zeros([79 1]);

for n=2:80
	%V = vander(linspace(-1, 1, n + 1));
	V = vander(cheb(n));

	k(n - 1) = cond(V);
end

plot(2:80, k);

n = 70;
xs = cheb(n);
V = vander(xs);
[L, U, P] = lu(V);
b = f(xs)';
y = L\(P*b);
a = U\y;

xs = linspace(-1, 1, 500);
ys = polyval(a, xs);
plot(xs, ys);
hold on;
