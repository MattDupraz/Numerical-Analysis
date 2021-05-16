% Preconditioned gradient method
function [x, n_iter, res] = pGrad(A, b, P_inv, tol)
	x = zeros(size(b));
	r = b - A*x;
	res = norm(r);
	n_iter = 0;
	norm_b = norm(b);
	while (res(end) > tol*norm_b)
		n_iter = n_iter + 1;

		Pr = P_inv(r);
		APr = A*Pr;
		alpha = (Pr'*r)/(Pr'*APr);
		x = x + alpha*Pr;
		r = r - alpha*APr;

		res = [res, norm(b-A*x)];
	end
end

