
function [x, err, steps] = jacobi(A, b, epsilon)
    N = diag(diag(A));
    P = N-A;

    inv_N = inv(N); # putem calcula asta usor pentru ca e diagonala
    steps = 0;

    G = inv_N * P;
    c = inv_N * b;
    prev_x = zeros(length(A), 1);

    if max(abs(eig(G))) >= 1
        max(abs(eig(G)))
        disp("This matrix can't use Jacobi");
        return;
    endif

    while 1
        x = G * prev_x + c;
        steps++;

        if norm(x - prev_x, inf) < epsilon
            err = norm(x - prev_x, inf);
            return;
        endif
        
        prev_x = x;
    endwhile

endfunction
