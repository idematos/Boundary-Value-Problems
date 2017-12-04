# Isabela Vegini de Matos 8531362

function W = shootingnaolinear(a,b,alpha,beta,N,TOL,M,f)
  h = (b-a)/N;
  k = 1;
  TK = (beta - alpha)/(b - a);
  
  W = zeros(3,N+1);
  while (k <= M)
    W(1,1) = alpha;
    W(2,1) = TK;    
    u1 = 0;
    u2 = 1;
    for i = 2:(N+1) # RK-4
      x = a + (i-1)*h;
      k11 = h*W(2,i-1);
      k12 = h*f(x,W(1,i-1),W(2,i-1));
      k21 = h*(W(2,i-1)+0.5*k12);
      k22 = h*f(x+0.5*h,W(1,i-1)+0.5*k11,W(2,i-1)+0.5*k12);
      k31 = h*(W(2,i-1)+0.5*k22);
      k32 = h*f(x+0.5*h,W(1,i-1)+0.5*k21,W(2,i-1)+0.5*k22);
      k41 = h*(W(2,i-1)+k32);
      k42 = h*f(x+h,W(1,i-1)+k31,W(2,i-1)+k32);
      W(1,i) = W(1,i-1)+(k11+2*k21+2*k31+k41)/6;
      W(2,i) = W(2,i-1)+(k12+2*k22+2*k32+k42)/6;
      k_11 = h*u2;
      k_12 = h*(-u1-2*W(2,i-1)*u2); #fy = 1 e fy' = -2y'
      k_21 = h*(u2+0.5*k_12);
      k_22 = h*(-u1-0.5*k_11-2*W(2,i-1)*(u2+0.5*k_12));
      k_31 = h*(u2+0.5*k_22);
      k_32 = h*(-u1-0.5*k_21-2*W(2,i-1)*(u2+0.5*k_22));
      k_41 = h*(u2+k_32);
      k_42 = h*(-u1-k_31-2*W(2,i-1)*(u2+k_32));
      u1 = u1 + (1/6)*(k_11+2*k_21+2*k_31+k_41);
      u2 = u2 + (1/6)*(k_12+2*k_22+2*k_32+k_42);
    endfor

    if(abs(W(2,N+1) - beta) <= TOL)
      for i = 1:(N+1)
        x = a + i*h;
        W(3,i) = x;
        disp(W);
      endfor
      return
    endif
    
    TK = TK - (W(1,N+1) - beta) / u1;
    k = k+1;
  endwhile
  
  disp('Numero maximo de iteracoes excedido!');
endfunction