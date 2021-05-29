% We define the functions that yield x_1 and x_2 from y and t
x_1 = @(t, y) (mean(t.^2)*mean(y) - mean(t)*mean(t.*y)) ...
						/ (mean(t.^2) - mean(t)^2);
x_2 = @(t, y) (mean(t.*y) - mean(t)*mean(y)) ...
						/(mean(t.^2) - mean(t)^2);

% Part (c)
load data.mat;

t = data(:, 1);
y = data(:, 2);

a = x_1(t, y);
b = x_2(t, y);

disp("Part (c)");
fprintf("x_1 = %g\n", a);
fprintf("x_2 = %g\n", b);

subplot(1, 3, 1);

scatter(t, y, 'filled');
hold on;

ts = [min(t), max(t)];
plot(ts, a + b*ts, 'LineWidth', 2);

set(gca, 'FontSize', 14);
grid on;

% Part (d)
f = @(t) 1./(2 + t);
t = [-1; 0; 1];
y = f(t);

a = x_1(t, y);
b = x_2(t, y);

disp("Part (d)");
fprintf("x_1 = %g\n", a);
fprintf("x_2 = %g\n", b);

subplot(1, 3, 2);

scatter(t, y, 'filled');
hold on;

ts = linspace(-1, 1, 100);
plot(ts, f(ts), 'LineWidth', 2);

ts = [-1, 1];
plot(ts, a + b*ts, 'LineWidth', 2);

set(gca, 'FontSize', 14);
grid on;

% Part (e)

t = (1:10)';
y = (1:10)';

a = x_1(t, y);
b = x_2(t, y);

disp("Part (e)");
fprintf("x_1 = %g\n", a);
fprintf("x_2 = %g\n", b);

y(10) = 5;
a = x_1(t, y);
b = x_2(t, y);

subplot(1, 3, 3);

scatter(t, y, 'filled');
hold on;

ts = [1, 10];
plot(ts, a + b*ts, 'LineWidth', 2);

f = @(x) norm(x(1) + x(2)*t - y, 1);
x = fminsearch(f, [0, 0]);
plot(ts, x(1) + x(2)*ts, '--', 'LineWidth', 2);

set(gca, 'FontSize', 14);
grid on;

