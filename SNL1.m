# Isabela Vegini de Matos 8531362

a = 1;
b = 5;
alpha = 0;
beta = log(5);
h = 0.25;
N = (b-a)/h;

f = @(x,W) [W(2); -(W(2))^2+W(1)+log(x)];

TOL = 0.01;
M = 100;

W = shootingnaolinear(a,b,alpha,beta,N,TOL,M,f);
