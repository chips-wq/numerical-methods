
function [out_y] = lagrange_points(in_x, known_x, known_y)
    num_points_calc = length(in_x);
    out_y = zeros(num_points_calc, 1);
    N = length(known_x)
    for k = 1:num_points_calc
        cur_x = in_x(k);
        L = ones(N, 1);

        for i = 1:N
            for j = 1:N
                if (i != j)
                    L(i) *= (cur_x - known_x(j)) / (known_x(i) - known_x(j));
                endif
            endfor
        endfor

        out_y(k) = known_y * L;
    endfor
endfunction
