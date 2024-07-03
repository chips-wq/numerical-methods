% R(1,1)
% R(2,1) R(2,2)
% R(3,1) R(3,2)
%
%
%
%
% R(n,1) R(n,2)
function res = romberg(f, a, b, n)
  format long
  # R(n, i) = T(f, h_i);
  # Where h_i = (b-a) / 2^(i-1);

  R = zeros(n);
  for i = 1:n
    % Asta ar trebui calculat folosing reguli recursive
    R(i,1) = trapeze(f, a, b, 2^(i-1));
  endfor

  % Acum umplem triunghiul Romberg folosind formula magica din lab
  % bazata pe extrapolare Richardson (care nu am inteles ce face)
  for j = 2:n
    for i = j:n
      R(i,j) = R(i, j-1) + (R(i,j-1) - R(i-1,j-1)) / (4^(j-1) - 1);
    endfor
    % break;
  endfor
  R
endfunction
