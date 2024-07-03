function [v, lambda] = iterare_ortogonala(A, max_steps, tol)
    [n,m] = size(A);
    assert(m == n, "Matricea nu e patratica");
    assert(A == A', "Matricea nu e simetrica");
    steps = 0;
    U_prev = rand(n);
    while 1
        [Q,R] = householder(U_prev);
        U_k = A * Q;
        if ++steps == max_steps || (norm(U_k(:, 1) - U_prev(:, 1), 2) < tol)
            [Q,R] = householder(U_k);
            v = Q;
            lambda = diag(R);
            return;
        endif
        U_prev = U_k;
    endwhile

endfunction
