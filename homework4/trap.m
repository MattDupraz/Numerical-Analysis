function T = trap(fun,a,b,n)
x = linspace(a,b,n+1);
f = feval(fun,x);
f(1) = f(1)/2;
f(end) = f(end)/2;
T = (b-a) * sum(f) / n;
end
