function [lambda, v, steps, err] = putere_deplasata(A, u0, alpha, tolerance, max_steps)
    n = length(A);
    steps = 0;
    v_prev = u0;
    while 1
        % This part gets me closer to the real eigenvector

        v = (A - alpha * eye(n)) \ v_prev;

        % u_(k+1) = (A - alpha * I_n) * u_k

        % Remove the norm to see the problem of it getting too small (if the smallest eigenvalue > 1)
        v = abs(v) / norm(v,2);

        % alpha = v' * (A) * v; % optimizarea catului lui Rayleigh

        % Uncomment the following line in order to visualize it
        % with putere_directa_visualize

        % quiver(0, 0, v(1), v(2));

        if steps++ == max_steps || norm(abs(v)-abs(v_prev), 2) < tolerance
            lambda = v' * A * v;
            err = norm(abs(v)-abs(v_prev),2);
            return;
        endif
        v_prev = v;
    endwhile
endfunction
