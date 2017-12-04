# Isabela Vegini de Matos 8531362

a = 1;
b = 5;

alpha = 0;
beta = log(5);

N = 8;
h = (b-a)/N;

TOL = 0.001;
M = 100;

f = @(x,w,z) -(z^2)-w+log(x);

W = shootingnaolinear(a,b,alpha,beta,N,TOL,M,f);

x = a:h:b;
plot(x,W(1,:),x,log(x));

sum = 0;
e = zeros(1,N);
for i = 1:N
  e(i) = abs(W(1,i)-log(i));
  sum = sum + e(i)^2;
endfor

err = zeros(1,N);
h = zeros(1,N);
for i = 1:N
  h(i) = (a - b)/i;
  err(i) = (sum*h(i))^(0.5);
endfor

#loglog(h,err,'linewidth',3);
#xlabel('h','fontsize',15);
#ylabel('||e||2','fontsize',15);
