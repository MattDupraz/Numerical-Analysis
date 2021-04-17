function max_errs=poly_err(f, max_n, xf, a, b)

max_errs = zeros([max_n + 1 1]);
aff = @(a, b, xs) (b-a)*(xs + 1)./2 + a;

for n=0:max_n
    xs = xf(n);
    p = polyfit(xs, f(aff(a, b, xs)), n);
    
    ev_xs = linspace(-1, 1, 10001);
    ys = polyval(p, ev_xs);
    errs = abs(ys - f(aff(a, b, ev_xs)));
    max_errs(n+1) = max(errs);
end
end
