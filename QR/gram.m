function [Q, R] = gram(A)
    [m,n] = size(A);
    if m != n
        disp("ERROR, this only works for square matrices");
        return;
    endif
    Q = zeros(n);
    for i = 1:n
        s = zeros(n,1);
        for j = 1:i-1
            s = s + Q(:, j)' * A(:, i) * Q(:, j);
        endfor
        aux = A(:, i) - s;
        Q(:, i) = aux / norm(aux,2);
    endfor
    R = Q' * A;
endfunction
