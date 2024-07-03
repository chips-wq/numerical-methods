function [x] = sup_triunghi(A, b)
    n = length(A);
    x = zeros(n,1);
    for i = n:-1:1
        s = 0;
        for j = i+1:n
            s += x(j) * A(i,j);
        endfor
        x(i) = (b(i) - s) / A(i,i);
    endfor
endfunction
