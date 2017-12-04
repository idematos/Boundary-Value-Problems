# Isabela Vegini de Matos 8531362

a = 1;
b = 5;
alpha = 0;
beta = 1/5;
N = 8;
TOL = 0.001;
M = 100;

f = @(x,w,z) -(z^2)-w+log(x);

W = shootingnaolinear2(a,b,alpha,beta,N,TOL,M,f);
