% beta = 2, t = 53
u = 2^(-53);

err = @(h) 2*exp(1)*u./h + 1/2*exp(1).*h;
real_err = @(h) abs((exp(1+h) - exp(1))./h - exp(1));

xs = logspace(-15, 0);

% Plotting values
hold on;
loglog(xs, err(xs), 'LineWidth', 2);
loglog(xs, real_err(xs), 'LineWidth', 2);

% Configuring axes style
xticks(10.^[-14:2:0])
xlabel('h');
set(gca, 'FontSize', 14);

% Setting up the legend
lgd = legend('Calculated error', 'Real error');
set(lgd, 'FontSize', 14);
