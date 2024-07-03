function [y] = rk2(f, t0, y0, h, n)
  % f = form of the derivative of y'(t) = f(t, y(t))
  % y(t0) = x0
  % y_{k+1} = y_k + 1/2 * (k1 + k2);
  % k1 = h * f(t_k, y_yk);
  % k2 = h * f(t_{k+1}, y_k + k1)
  y = zeros(1, n+1); % n + 1 points
  t_k = t0;
  y(1) = y0;
  for i = 2:n+1
    k1 = h * f(t_k, y(i-1));
    k2 = h * f(t_k + h, y(i-1) + k1);
    y(i) = y(i-1) + 1/2 * (k1 + k2);
    t_k = t_k + h;
  endfor
endfunction
