function [x, err, steps] = sor_vintila(A, b, omega, tol, max_iter)
    n = length(A);
    x0 = zeros(length(A), 1);
    x = x0;

    steps = 0;
    for k = [1 : max_iter]
        for i = [1 : n]
            val_sum = (A(i,1:i-1) * x(1:i-1)) + (A(i,i+1:n) * x0(i+1:n));
            x(i) = (1-omega) * x0(i) + omega * (b(i) - val_sum) / A(i,i);
        end
        if norm(x - x0) < tol
            break
        end
        x0 = x;
        steps = k;
    end
    err = norm(x-x0, 2);
end
