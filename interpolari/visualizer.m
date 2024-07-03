
a = -500; % start of interval
b = 500; % end of interval

% uniform distribution of points between 10 and 100
x = rand(1,50) .* (b-a) + a;


% fun = @(x) x.^3.2 - x - 1;
% fun = @(x) 3*x.^1.4 - 17

% y = fun(x)


y = 0.2 * x .^ 3 / (3^10) - 17
plot(x,y,'bo');

in_x = linspace(a,b, 100);

% plot with blue circles

out_y = lagrange_points(in_x, x, y);

hold on;
plot(in_x, out_y, 'g-');


