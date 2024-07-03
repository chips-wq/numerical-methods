function [x, err, steps] = newton(fun, fun_prime, x0, tol, max_steps)
    steps = 0;
    while 1
        x = x0 - fun(x0) / fun_prime(x0);
        if norm(x - x0, 2) < tol || ++steps == max_steps
            err = x-x0;
            return;
        endif
        x0 = x;
    endwhile
endfunction
