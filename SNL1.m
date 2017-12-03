# Isabela Vegini de Matos 8531362

a = 1;
b = 5;
alpha = 0;
beta = log(5);
h = 0.5;
TOL = 0.1;
M = 50;

f = @(x,w,z) -(z^2)+w+log(x);

W = shootingnaolinear(a,b,alpha,beta,h,TOL,M,f);
