function [res] = bezier(time_step, points, n, m)
  if m == n+1
    p1 = points(n, :);
    p2 = points(m, :);
    res = (1-time_step) * p1 + time_step * p2;
    return;
  endif
  if m <= n
    disp("big error");
  endif

  res = (1-time_step) * bezier(time_step, points, n, m-1) + time_step * bezier(time_step, points, n+1, m);
  return;

  disp("not now");
endfunction
