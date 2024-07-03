% Matricea noastra arata in urmatoarea forma
%
%   A =
%   a0   b0   c0   d0  a1    b1   c1   d1
%   1    0    0    0    0    0    0    0
%   0    0    0    0    1    0    0    0
%   0    0    0    0    1    1    1    1
%   1    2    4    8   -1    0    0    0
%   0    1    4   12    0   -1    0    0
%   0    0    2   12    0    0   -2    0
%   0    0    1    0    0    0    0    0
%   0    0    0    0    0    0    2    6
%
% s_i = a_i + b_i(x-x_i) + c_i(x-x_i)^2 + d_i(x-x_i)^3

function [S] = spline_c2(x, y)
  % x = [x0, x1 .... xn]
  % y = [y0, y1 .....yn]
  % vom avea n polinoame de tip spline intre astea

  % n polinoame, avem nev de 4 * n ecuatii
  n = length(x) - 1; 
  A = zeros(4 * n);

  j = 1; % ecuatia curenta

  % Trece prin punctul de control s_i(x_i) = y_i => a_i = y_i
  for i = 0:n-1
    A(j, 4 * (i) + 1) = 1; % coef. a_i = 1
    j += 1;
  endfor
  % Conectam ultima s_(n-1)(x_n) = y_n
  
  A(j, 4 * (n-1) + 1) = 1;
  A(j, 4 * (n-1) + 2) = x(n+1) - x(n);
  A(j, 4 * (n-1) + 3) = (x(n+1) - x(n))^2;
  A(j, 4 * (n-1) + 4) = (x(n+1) - x(n))^3;
  j += 1;


  % Racordarile s_i(x_i+1) = s_(i+1)(x_(i+1))
  for i = 0:n-2
    % a_i coef
    A(j, 4 * i + 1) = 1;
    % b_i
    A(j, 4 * i + 2) = x(i+2) - x(i+1);
    % c_i
    A(j, 4 * i + 3) = (x(i+2) - x(i+1)) ^ 2;
    % d_i 
    A(j, 4 * i + 4) = (x(i+2) - x(i+1)) ^ 3;
    % a_i+1
    A(j, 4 * (i+1) + 1) = -1;
    j+=1;
  endfor

  % Derivata s_i'(x_i+1) = s_(i+1)'(x_(i+1))
  for i = 0:n-2
    % b_i
    A(j, 4 * i + 2) = 1;
    % c_i
    A(j, 4 * i + 3) = 2 * (x(i+2) - x(i+1));
    % d_i 
    A(j, 4 * i + 4) = 3 * (x(i+2) - x(i+1)) ^ 2;
    % b_i+1
    A(j, 4 * (i+1) + 2) = -1;
    j+=1;
  endfor

  % Derivata a doua s_i''(x_i+1) = s_(i+1)''(x_(i+1))
  for i = 0:n-2
    % c_i
    A(j, 4 * i + 3) = 2;
    % d_i 
    A(j, 4 * i + 4) = 6 * (x(i+2) - x(i+1));
    % c_i+1
    A(j, 4 * (i+1) + 3) = -2;
    j+=1;
  endfor

  % Modul "natural"
  % s_0''(x0) = 0
  A(j, 3) = 1;
  j+=1;
  % s_(n-1)''(x_n) = 0
  A(j, 4 * (n-1) + 3) = 2;
  A(j, 4 * (n-1) + 4) = 6 * (x(n+1) - x(n));

  % Cat este b, e doar y' and then fill with zeros
  b = [y'; zeros(4*n-n-1,1)];

  s = A \ b;

  % s(1:4) -> s0, cu coeficientii a_i, b_i, c_i, d_i (ii vrem pe dos)
  % s(5:8) -> s1
  S = reshape(s, 4, n);
  % numel(s)

  % Facem coeficientii pe dos
  for i = 1:n
    S(:, i) = flip(S(:, i));
  endfor
end
