
function [v, lambda] = putere_ortogonala(A, max_steps, tol)
    [n,m] = size(A);
    assert(m == n, "Matricea nu e patratica");
    assert(A == A', "Matricea nu e simetrica");
    v = zeros(n);
    lambda = zeros(1, n);
    for i = 1:n
        u_prev = rand(n, 1);
        u_prev = u_prev / norm(u_prev, 2);
        while 1
            % Ii scoatem componentele ce corespund vectorilor
            % ortognali pe care deja i-am gasit
            s = 0;
            for j = 1:i-1
                s += v(:, j)' * u_prev * v(:, j);
            endfor
            u_prev = u_prev - s;
            % !! Din cauza erorilor de rotunjire si de reprezentare a lui 0
            % Facem asta la fiecare pas
            steps = 0;
            u_k = A * u_prev;
            u_k = u_k / norm(u_k, 2);
            if ++steps == max_steps || norm(abs(u_k) - abs(u_prev)) < tol
                v(:, i) = u_k;
                lambda(i) = u_k' * A * u_k;
                break;
            endif
            u_prev = u_k;
        endwhile
    endfor
endfunction
