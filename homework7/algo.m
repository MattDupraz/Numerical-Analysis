% Calculates the solution of Bx = b
% where B is a matrix of the form specified in exercise
% and b is the vector ones(n, 1)
function x=algo(n)
    B = sparse_matrix(n);
	B(1, 1) = -1;
	B(n, n) = -1;
	B(1, n) = 1;
	B(n, 1) = 1;

    % u = numbers on the diagonal of U
    u = zeros(n, 1);
    % c = last column of U
    c = zeros(n-1, 1);
    % beta = numbers one above diagonal of U
    beta = zeros(n-2, 1);
    % l = numbers one below diagonal of L
    l = zeros(n-2, 1);
    % d = last row of L
    d = zeros(n-1, 1);

    % We compute the relevant values for the LU factorization
    u(1) = B(1, 1);
    d(1) = B(n, 1)/u(1);
    c(1) = B(1, n);
    
    for i=2:(n-1)
        beta(i-1) = B(i-1, i);
        l(i-1) = beta(i-1)/u(i-1);
        u(i) = B(i, i) - beta(i-1)*l(i-1);
        if i == n-1
            c(i) = B(i, n) - c(i-1)*l(i-1);
            d(i) = (B(n, i) -(beta(i-1)*d(i-1)))/u(i);
        else
            c(i) = - c(i-1)*l(i-1);
            d(i) = - (beta(i-1)*d(i-1))/u(i);
        end
    end
    
    u(n) = B(n, n) - sum(c .* d);

	b = ones(n, 1);
	x = zeros(n, 1);
	y = zeros(n, 1);
    
    % We calculate y through forward substitution
    y(1) = b(1);
    for i=2:n-1
        y(i) = b(i) - y(i-1)*l(i-1);
    end
    y(n) = b(n) - sum(d .* y(1:n-1));
    
    % We calculate x through backwards substitution
    x(n) = y(n)/u(n);
    x(n-1) = (y(n-1) - c(n-1)*x(n))/u(n-1);
    for i=n-2:-1:1
        x(i) = (y(i) - c(i)*x(n) - beta(i)*x(i+1))/u(i);
    end
end
