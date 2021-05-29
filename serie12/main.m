[y, Fs] = audioread('foryoublue.wav');

z = fft(y);
ztilde = z.*(abs(z) > 5);
ytilde = ifft(ztilde);

