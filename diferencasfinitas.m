function w = finiteDifferences(a,b,alpha,beta,N,TOL,M,f)
  h = (b-a)/(N+1); 
  w = zeros(1,N+2);
  w(1) = alpha;
  w(N+2) = beta;
  
  for i = 2:N+1
    w(i) = alpha + i*((beta - alpha)/(b - a))*h;
  endfor
  
  k = 1;
  
  A = zeros(1,N);
  B = zeros(1,N);
  C = zeros(1,N);
  D = zeros(1,N);
  while (k <= M)
    x = a + h;
    t = (w(3) - alpha)/(2*h);
    A(1) = 2 - h**2; #fy = -1
    B(1) = -1+(h/2)*(-2*t); #fy' = -2y'
    D(1) = -(2*w(2)-w(3)-alpha+(h**2)*f(x,w(2),t));
    for i = 2:(N-1)
      x = a + i*h;
      t = (w(i+2)-w(i))/(2*h);
      A(i) = 2-h**2;
      B(i) = -1+(h/2)*(-2*t);
      C(i) = -1-(h/2)*(-2*t);
      D(i) = -(2*w(i+1)-w(i+2)-w(i)+h**2*f(x,w(i+1),t));
    endfor
    x = b - h;
    t = (beta - w(N))/(2*h);
    A(N) = 2-h**2;
    C(N) = -1-(h/2)*(-2*t);
    D(N) = -(2*w(N+1)-w(N)-beta+(h**2)*f(x,w(N+1),t));
    
    l = zeros(1,N);
    u = zeros(1,N);
    z = zeros(1,N);
    l(1) = A(1);
    u(1) = B(1)/A(1);
    z(1) = D(1)/l(1);
    
    for i = 2:(N-1)
      l(i) = A(i) - C(i)*u(i-1);
      u(i) = B(i)/l(i);
      z(i) = (D(i)-C(i)*z(i-1))/l(i);
    endfor
    
    l(N) = A(N)-C(N)*u(N-1);
    z(N) = (D(N)-C(N)*z(N-1))/l(N);
    
    v = zeros(1,N);
    v(N) = z(N);
    w(N+1) = w(N+1) + v(N);
    
    for i = (N-1):-1:1
      v(i) = z(i) - u(i)*v(i+1);
      w(i+1) = w(i+1) + v(i);
    endfor  
    if(norm(v) <= TOL)
      for i = 0:(N+1)
        x = a + i*h;
        disp(x), disp(w(i+1)), disp(' ');
      endfor
     return
    endif
    k = k+1;
  endwhile
  disp('Maximum number of iterations exceeded!');
endfunction
