% Solve for n=10 and display the relative error
[x, ~, B, b] = solve(10);
fprintf("x = \n")
disp(x');
error = norm(B*x - b)/norm(b);
fprintf("Relative error: %d\n", error);

% Solve for large n and measure the time taken
t = zeros(1, 6);
for i = 2:7
	[~, t(i-1)] = solve(10^i);
end

% Plot time taken against n
loglog(10.^(2:7), t, 'LineWidth', 2);
ylabel('Time in seconds');
xlabel('n');
grid on;
set(gca, 'FontSize', 14);