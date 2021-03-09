%% main.m

%% Definitions
func = @(x) 2./(exp(x) - 1) - 2./sqrt(x) + 1;
dfunc = @(x) 1./x.^(3/2) - 2*exp(x)./(exp(x) - 1).^2;

%% Part (a)
a = func([0.5, 1.7, 2.1, 4.5])

%% Part (b)
b = dfunc([0.5, 1.7, 2.1, 4.5])

%% Part (c)
subplot(2, 1, 1)
xs = linspace(0, 100, 500);
plot(xs, func(xs))

subplot(2, 1, 2)
xs = linspace(1/2, 10, 500);
plot(xs, func(xs))

%% Part (d)
tol = 1e-6;
for i=1:10
	str = sprintf('Init. val: %d', i);
	disp(str)
	disp(newton(func, dfunc, i, tol));
end
