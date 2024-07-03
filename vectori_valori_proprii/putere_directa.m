function [lambda, v, steps, err] = putere_directa(A, u0, tolerance, max_steps)
    steps = 0;
    v_prev = u0;
    while 1
        v = A * v_prev;
        % Remove the norm to see the problem of it getting too big
        v = v / norm(v,2);

        % Uncomment the following line in order to visualize it
        % with putere_directa_visualize
        % quiver(0, 0, v(1), v(2));

        if steps++ == max_steps || norm(v-v_prev, 2) < tolerance
            lambda = v' * A * v;
            err = norm(v-v_prev,2);
            return;
        endif
        v_prev = v;
    endwhile
endfunction
