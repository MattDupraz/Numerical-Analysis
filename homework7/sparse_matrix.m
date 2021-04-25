function A = sparse_matrix(n)
%Returns a tridiagonal matrix in sparse format

i = [(2:n)';(1:n)';(1:(n-1))'];
j = [(1:(n-1))';(1:n)';(2:n)'];
s = [ones(n-1,1);-2*ones(n,1);ones(n-1,1)];
A = sparse(i,j,s,n,n);

end
