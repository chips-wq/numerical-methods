
function [A] = test_ortogonal(eigenvalues)
    A = diag(eigenvalues);
    % We want a symmetric matrix, so we will get an orthogonal one and multiply it on both sides
    B = rand(length(A));
    % Let's construct an orthonormal basis from column vectors in B
    [Q,R] = householder(B);

    A = Q' * A * Q;
    % Ensure it is symmetric (it may not be, because of round-off error);
    A = tril(A) + tril(A)' - diag(diag(A));
endfunction


