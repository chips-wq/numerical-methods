function s = adaptive_simpson(f, a, b, tol)
  # We suppose that f(epsilon1) = f(epsilon) s.t the error now becomes
  # 1/15 * (S(a,b,h) - S(a, (a+b)/2, h/2) - S((a+b)/2, b, h/2))
  S_left = simpson(f, a, (a+b)/2, 1);
  S_right = simpson(f, (a+b)/2, b, 1);
  err_estimation = simpson(f,a,b,1) - S_left - S_right;
  if err_estimation < 15 * tol
    # Case where assumption was true, error is "evenly distributed"
    s = S_left + S_right;
    # this is our approximation
    return;
  endif
  # Case where err_estimation was bad, go to subintervals
  s = adaptive_simpson(f, a, (a+b)/2, tol/2) + adaptive_simpson(f, (a+b)/2, b, tol/2);
  return;
endfunction
