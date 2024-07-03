function res = trapeze(f, a, b, n)
  % Calculate integral from a to b of f using n + 1 points
  h = (b-a)/n;

  % x_points = [0:n] * h + a;
  x_points = a + h:h:b-h;
  res = h * (f(a) + f(b) / 2 + sum(f(x_points)));
endfunction
