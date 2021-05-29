disp("Convolution of vectors x, y: ");
x = (1:10)';
y = (10:-1:1)';
z = convolution(x, y)

disp("Product of polynomials p_x, p_y:")
x = [1; 1; 2; 3];
y = [3; 2; 1; 1];
z = poly_product(x, y)
