function [polynomial] = vandermonde(x_coord, y_coord)
    % Example:
    %             S = {(0, 1), (1,0), (2/3, 1/2)};
    %                   ^  ^
    %                  x0  y0
    % x_coord = [0,1,2/3];
    % y_coord = [1,0,1/2];

    N = length(x_coord); % N-1 e gradul polinomului, am N ecuatii
    A = zeros(N);

    for i = 1:N
        A(:, i) = x_coord' .^ (N-i);
    endfor

    A
    polynomial = A \ y_coord';
    
    
endfunction
