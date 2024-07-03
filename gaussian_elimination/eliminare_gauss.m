function [U, b] = eliminare_gauss(A, b)
    [n, m] = size(A);
    if n != m
        disp("Not a square matrix");
        return;
    endif
    for p = 1:n
        for i = p+1:n # go through each element under the main diagonal
            u_ip = A(i,p) / A(p,p);
            A(i,p) = 0;
            for j = p+1:n
                A(i,j) = A(i,j) - u_ip * A(p,j);
            endfor
        endfor
    endfor
    U = A;
endfunction
