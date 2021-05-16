function [x, n_iter, res] = gradient(A, b, tol)
	x = zeros(size(b));
	r = b - A*x;
	res = [norm(r)];
	for n_iter=1:5000
		Ar = A*r;
		alpha = (r'*r)/(Ar'*r);
		x = x + alpha*r;
		r = r - alpha*Ar;
		res = [res, norm(r)];
		if (res(end) < tol)
			break;
		end
	end
end
