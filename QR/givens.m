function [Q,R] = givens(A)
    [m,n] = size(A);

    Q = eye(m);
    for j = 1:n
        for i = j+1:m
            G_ij = eye(m);

            r = sqrt(A(i,j) ^ 2 + A(j,j) ^ 2);

            sin_theta = -A(i,j) / r;
            cos_theta = A(j,j) / r;

            G_ij(i,j) = sin_theta;

            G_ij(j,j) = cos_theta;
            G_ij(j,i) = -sin_theta;
            G_ij(i,i) = cos_theta;

            rats(G_ij)

            A = G_ij * A;
            Q = Q * G_ij';
        endfor
    endfor
    R = A;

endfunction
