function analyze(f, a, b, I)
	Q = zeros(1, 5);
	P = zeros(1, 5);
    % Calculating the values of the integral calculated
    % using the quadratures Q and P
	for i=1:5
		Q(i) = my_quad(f, a, b, 10^i);
		P(i) = trap(f, a, b, 10^i);
    end

    % Error between real integral and calculated values
	E_Q = abs(Q - I);
	E_P = abs(P - I);

    % Displaying the errors
	fprintf('N = 10^%d; E_Q = %g, E_P = %g\n',...
		[1:5; E_Q; E_P]);

    % Graphing the errors on a log-log scale
	N = 10.^(1:5);
	loglog(N, E_Q, 'LineWidth', 2);
	hold on;
	loglog(N, E_P, 'LineWidth', 2);
    % Changing the style of the plot
    grid on;
    xlabel('N');
    set(gca, 'FontSize', 14);
    % Setting up the legend
    lgd = legend('Error of Q[f]', 'Error of P[f]');
    set(lgd, 'FontSize', 14);
end

