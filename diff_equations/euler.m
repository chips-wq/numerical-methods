function [x_values] = euler(f, t0, x0, h, n)
  % h = what is the size of a step
  % n = how many time steps should there be
  % f = (t, x(t)), where x' = f(t, x) and x(t0) = x0
  x_values = zeros(1, n+1);
  x_values(1) = x0;
  for k = 2:n+1
    x_values(k) = x_values(k-1) + h * f(t0 + h * (k-2), x_values(k-1));
  endfor
endfunction
