function [x, err, steps] = sor(A, b, omega, tol, max_steps)
    % omega * A = N - P;
    % we are solving the system omeg * A * x = b;
    % so multiply at the end by omega

    D = diag(diag(A));
    N = tril(A, -1) * omega + D;
    P = D - omega * D - triu(A, 1) * omega;

    n_inv = inv(N);

    G = n_inv * P;
    c = n_inv * b;

    ro_G = max(abs(eig(G)));
    if ro_G >= 1
        x = zeros(length(A), 1);
        err = inf;
        steps = inf;
        disp("NOT CONVERGENT");
        return;
    endif

    steps = 0;
    x_prev = zeros(length(A), 1);
    while 1
        # Forma matriceala, rezolv un sistem inferior triunghiular SIT(N, P*prev_x + b);
        x = N \ (P * x_prev + b);
        if ++steps == max_steps || norm(x-x_prev, 2) < tol
            err = norm(x-x_prev, 2);
            break;
        endif
        x_prev = x;
    endwhile
    x = omega * x;

endfunction
