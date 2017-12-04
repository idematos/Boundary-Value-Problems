# Isabela Vegini de Matos 8531362

a = 1;
b = 5;
alpha = 0;
beta = log(5);
N = 15;
TOL = 0.001; # erro de newton 
M = 100;

f = @(x,w,z) -(z^2)-w+log(x);

W = diferencasfinitas(a,b,alpha,beta,N,TOL,M,f);
