function res = simpson(f, a, b, n)
  % Calculate integral from a to b of f using 2 * n + 1 points
  h = (b-a)/(2 * n);

  % x_{2i-1}
  x_impar_interior = [a + h: 2*h: b-h];
  x_par_interior = [a + 2 * h: 2 * h: b - 2 *h];
  % x_points = [0:n] * h + a;
  res = h/3 * (f(a) + f(b) + 4 * sum(f(x_impar_interior)) + 2 * sum(f(x_par_interior)));
endfunction
