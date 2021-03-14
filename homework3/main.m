% Symbolic function, which calculates the relative error of a given
% method for computing exp(x) at some given point
rel_err = @(f, x) abs(f(x) - exp(x))/exp(x);

% Display the calculated value and relative error of myexp
fprintf('myexp(-20) = %g\n', myexp(-20));
fprintf('Relative error: %g\n', rel_err(@myexp, -20));

disp('---')

fprintf('myexp(-0.5) = %g\n', myexp(-0.5));
fprintf('Relative error: %g\n', rel_err(@myexp, -0.5));

% Display the relative errors of myexp2 at a collection of points
disp('---')
disp('Calculating relative errors for myexp2(x):')
for x=-20:2:-2
	fprintf('x = %d: %.16g\n', x, rel_err(@myexp2, x));
end
