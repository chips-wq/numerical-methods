function [Q, R, H_p] = householder(A)
    [m,n] = size(A);
    reflectors = min(m-1, n);

    Q = eye(m);
    R = eye(m,n);

    for p = 1:reflectors
        v_p = [zeros(p-1, 1); A(p:m, p)];

        sigma_p = sign(A(p,p)) * norm(A(p:m,p), 2);

        v_p(p) += sigma_p;

        H_p = eye(m) - 2 * (v_p * v_p') / (v_p' * v_p);

        A = H_p * A;
        Q = Q * H_p;
    endfor
    R = A;
endfunction
