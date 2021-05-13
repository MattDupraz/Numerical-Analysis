function [x]=richardson(A, P, alpha, b, x)
	f = alpha*(P\b);
	B = speye(size(A)) - alpha*(P\A);

	err = [norm(A*x - b)];
	for k=1:500
		x = B*x + f;

		r = norm(A*x - b);
		err = [err, r];
		if (r < 10^(-13))
			break
		end
	end

	semilogy(0:(size(err)(2) - 1), err, 'LineWidth', 2);
	grid on;
	set(gca, 'FontSize', 14);

