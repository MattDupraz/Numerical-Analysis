% Setting up values for part (d)
I = (1 - exp(-2)*(sin(2) + cos(2)))/2;
f = @(x) exp(-x).*sin(x);
a = 0;
b = 2;
subplot(2, 1, 1);

str = 'exp(-x) * sin(x)';
fprintf('f(x) = %s\n', str);
% Display and graph the errors
analyze(f, a, b, I);
title(sprintf('Errors for f(x) = %s', str));

disp('---');

% Setting up values for part (f)
I = 16/5 * sqrt(2);
f = @(x) sqrt(abs(x).^3);
a = -2;
b = 2;
subplot(2, 1, 2);

str = 'sqrt(|x|^3)';
fprintf('f(x) = %s\n', str);
% Display and graph the errors
analyze(f, a, b, I);
title(sprintf('Errors for f(x) = %s', str));
