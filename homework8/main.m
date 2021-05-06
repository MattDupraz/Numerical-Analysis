% We define the functions we use
f1 = @(x) exp(x);
f2 = @(x) sqrt(abs(1/2 - x));

% Functions and values of N we want to
% iterate over
fs = {f1, f2};
Ns = [2, 5, 10];

% Evaluation points
z = linspace(0, 1, 1000);

errors = zeros(2, 3);

for i=1:2
    f = fs{i};
    y = f(z);
    for j=1:3
        N = Ns(j);
        % Calculate approximated values
        approx_y = approximate(f, N, z, 0)';
        errors(i, j) = max(abs(approx_y - y));

        % Display results
        subplot(3, 2, i + 2*(j-1));
        plot(z, approx_y);
        hold on;
        plot(z, y);
        title(sprintf("f%g, N = %g", i, N));
    end
end

disp(errors);

% We use lambda = 10^(-14)
corrected_y = approximate(f2, 10, z, 10^(-14))';
error = max(abs(f2(z) - corrected_y));
disp(error);




