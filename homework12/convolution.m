function z=convolution(x, y)
	xhat = fft(x);
	yhat = fft(y);
	z = ifft(xhat .* yhat);
