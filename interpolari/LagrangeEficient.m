function rez = LagrangeEficient (x , y , a )
  n = length(x);
  % x - vector ce contine abscisele punctelor cunoscute
  % y - vector ce contine ordonatele punctelor cunoscute
  % a - punctul de abscisa in care vrem sa aflam valoarea polinomului
  % rez - valoarea polinomului in punctul dorit
  U = ones (n) * diag (x) - diag (x) * ones (n) + eye (n);
  V =  a - (diag (x) * ~eye(n)) - eye(n) * a + eye(n);
  rez = prod (V) ./ prod (U) * y';
endfunction
