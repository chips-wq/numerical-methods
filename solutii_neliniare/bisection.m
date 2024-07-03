function [c, steps] = bisection(fun, a, b, max_tol, max_steps)
    if fun(a) * fun(b) > 0
        disp("ERROR\n");
        return;
    endif

    steps = 0;
    while 1
        c = (a+b)/2;
        if (b-a) < max_tol || ++steps == max_steps
            return;
        endif
        if fun(a) * fun(c) < 0
            b = c;
        elseif fun(c) * fun(b) < 0
            a = c;
        else
            if fun(c) != 0
                disp("ASSERTION FAILED\n");
            endif
            return;
        endif
    endwhile

endfunction
