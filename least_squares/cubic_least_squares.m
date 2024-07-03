function [a] = cubic_least_squares(x_i, y_i)
  % Make sure n = 3 + 1 < m
  m = length(x_i);
  x_powers = zeros(7, m);
  for i = 1:m
    x_powers(i, :) = x_i .^ (i-1);
  endfor

  x_powers
  % Termeni liberi
  b = zeros(4,1);

  % Matricea coeficientilor
  S = zeros(4)
  for i = 1:4
    b(i) = sum(y_i .* x_powers(i, :))

    for j = 1:4
      S(i,j) = sum(x_powers(i+j-1, :));
    endfor
  endfor
  a = S \ b;
  a = flip(a);
endfunction
