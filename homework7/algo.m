function [L, U, x]=algo(n)
	B = sparse_matrix(n);
	B(1, 1) = -1;
	B(n, n) = -1;
	B(1, n) = 1;
	B(n, 1) = 1;

	U = B;
	L = speye(n);

	for i=1:(n-1)
		a = (U(i+1, i)/U(i, i));
		U(i+1, :) = U(i+1, :) - a*U(i, :);
		L(i+1, i) = a;
		if i != n-1
			b = (U(n, i)/U(i, i));
			U(n,:) = U(n, :) - (U(n, i)/U(i, i))*U(i, :);
			L(n, i) = b;
		end
	end

	b = ones(n, 1);

	x = zeros(n, 1);
	y = zeros(n, 1);

	for i=1:n
		y(i) = b(i)/L(i, i);
		if i <= n-1
			b(i+1) = b(i+1) - (L(i+1, i)/L(i, i))*b(i);
		end
		if i < n-1
			b(n) = b(n) - (L(n, i)/L(i, i))*b(i);
		end
	end

	for i=n:-1:1
		x(i) = y(i)/U(i, i);
		if i == n
			for i=1:(n-1)
				y(i) = y(i) - (U(i, n)/U(n,n))*y(n);
			end
		elseif i >= 2
			y(i-1) = y(i-1) - (U(i-1, i)/U(i, i))*y(i);
		end
	end
end
