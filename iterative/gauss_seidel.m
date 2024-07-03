function [x, err, steps] = gauss_seidel(A,b, epsilon, max_steps)
    [m,n] = size(A);
    if (m != n)
        disp("ERROR, not square matrix");
        return;
    endif
    N = tril(A); % L + D
    P = N - A; % P = -U

    % A = L + D + U
    % A = N - P

    G = inv(N) * P;
    if max(abs(eig(G))) >= 1
        disp("Doesn't converge");
        return;
    endif


    steps = 0;
    prev_x = zeros(n, 1);
    while 1
        # solve the system Nx_k+1 = Px_k + b

        # Forma matriceala, rezolv un sistem inferior triunghiular SIT(N, P*prev_x + b);
        x = N \ (P * prev_x + b); % forward substitution 

        if norm(x - prev_x, 2) < epsilon || ++steps == max_steps
            err = norm(x - prev_x, 2);
            return;
        endif
        prev_x = x;

    endwhile
endfunction
