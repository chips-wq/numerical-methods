function [A] = smecherie(A, tol, max_steps)

    for i = 1:max_steps
        [Q,R] = householder(A);
        A = R * Q;
    endfor

endfunction
