% quiver(0, 0, 1, 1)
hold on;
axis([-2 2 -2 2])
% axis([-10 10 -10 10])
rectangle('Position',[-1,-1,2,2],'Curvature',[1,1],'EdgeColor','r')
% quiver(0, 0, cos(pi/4), sin(pi/4), 'b') % This is the new vector on the circle

% A = [1.3125 0.125; -0.15625 0.9375]
j
% A = [1.637500  -0.037500;
%    1.237500   1.162500]

A = [8.1912  -4.3676;
   2.7794  -3.1912];

% u0 = [cos(pi/4); sin(pi/4)];
u0 = rand(3,1);
u0 = u0 / norm(u0, 2);

% [lambda, v, steps, err] = putere_directa(A, u0, 1e-9, 100)

% [lambda2, v2, steps2, err2] = putere_inversa(A, u0, 1e-9, 100)


C = [9.7759   -7.7581    4.5838;
    2.1876  -12.3744   12.2027;
    1.5370  -13.6508   15.5985]

eig(C) % [-3 7 9];

alpha = -2.5; % closest to 7
eig(C-alpha * eye(3))

[lambda, v, steps, err] = putere_deplasata(C, u0, alpha, 1e-9, 100)

pause;
