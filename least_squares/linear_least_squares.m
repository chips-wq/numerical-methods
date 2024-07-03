function [a1 a0 err] = linear_least_squares(x_i, y_i)
  % Just calculate two coefficients of the line best approximating
  % the equations are derived by minimizing the function
  % E(a0, a1) = sum_{i=1}^m (y_i - (a1 * x_i + a0)) ^ 2
  % Compute partial derivatives with respect to a0 and a1
  
  m = length(x_i);

  S_x = sum(x_i);
  S_y = sum(y_i);
  S_x_2 = sum(x_i .^ 2);
  S_x_y = sum(x_i .* y_i);

  a0 = (S_x_2 * S_y - S_x_y * S_x) / (m * S_x_2 - S_x ^ 2);
  a1 = (m * S_x_y - S_x * S_y) / (m * S_x_2 - (S_x) ^ 2);

  err = sum((y_i - polyval([a1, a0], x_i)) .^ 2);

endfunction
