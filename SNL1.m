# Isabela Vegini de Matos 8531362

a = 1;
b = 5;
alpha = 0;
beta = log(5);
N = 15;
TOL = 0.2;
M = 10000;

f = @(x,w,z) -(z^2)-w+log(x);

W = shootingnaolinear(a,b,alpha,beta,N,TOL,M,f);
