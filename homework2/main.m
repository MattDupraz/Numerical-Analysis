% Values of p and q for the three polynomials
ps(1) = 2.5;
qs(1) = 1;
ps(2) = -10000000000.0000000001;
qs(2) = 1;
ps(3) = 2^30 + 2^(-30);
qs(3) = 1;

% Calculating roots of the three polynomials
for i=1:3
	[xs1(i), xs2(i)] = roots2(ps(i), qs(i));
end

% Real roots of the three polynomials
rxs1(1) = -0.5;
rxs2(1) = -2;
rxs1(2) = 10^10;
rxs2(2) = 10^(-10);
rxs1(3) = -2^(-30);
rxs2(3) = -2^30;

% Calculating the errors between
% the calculated and real roots
rel_err = @(x, rx) abs(rx - x)./abs(rx);

errs1 = rel_err(xs1, rxs1);
errs2 = rel_err(xs2, rxs2);

% Evaluating the polynomials at the calculated roots
evs1 = qs + ps.*xs1 + xs1.^2;
evs2 = qs + ps.*xs2 + xs2.^2;

% The bad root is smaller in magnitude
for i=1:3
	if (abs(xs1(i)) >= abs(xs2(i)))
		recov(i) = qs(i)/xs1(i);
	else 
		recov(i) = qs(i)/xs2(i);
	end
end

% Evualuationg polynomial at x_bad
ev_recov = qs + ps.*recov + recov.^2;

% Displaying everything in a readable manner
disp('--------------------')
for i=1:3
	str = sprintf('Quadratic %i: x^2 + %dx + %d', ...
		i, ps(i), qs(i));
	disp(str);

	str = sprintf('Calculated roots to %i: x+ = %d, x- = %d', ...
		i, xs1(i), xs2(i));
	disp(str);

	str = sprintf('Real roots to %i: x+ = %d, x- = %d', ...
		i, rxs1(i), rxs2(i));
	disp(str);

	str = sprintf('Relative errors to %i: x+ -> %d, x- -> %d', ...
		i, errs1(i), errs2(i));
	disp(str);

	str = sprintf(...
		'Evaluation of %i at computed roots: P(x+) = %d, P(x-) = %d', ...
		i, evs1(i), evs2(i));
	disp(str);

	str = sprintf('Recovered bad root of %i from good root: %d',...
		i, recov(i));
	disp(str);

	str = sprintf('Evaluation of %i at revovered bad root: %d',...
		i, ev_recov(i));
	disp(str);

	disp('--------------------')
end

