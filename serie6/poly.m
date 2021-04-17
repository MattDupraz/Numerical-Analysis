f = @(x) sin(x);
n = 100;

xs = linspace(0, 3*pi, n+1);
p = polyfit(xs, f(xs), n);

xs = linspace(0, 3*pi, 1001);
ys = polyval(p, xs);
errs = abs(polyval(p, xs) - f(xs));

subplot(2, 1, 1)

plot(xs, f(xs))
hold on;
plot(xs, ys);

subplot(2, 1, 2)
plot(xs, errs)
