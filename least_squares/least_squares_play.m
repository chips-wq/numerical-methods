
x_i = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y_i = [1.3, 3.5, 4.2, 5.0, 7.0, 8.8, 10.1, 12.5, 13.0, 15.6];

plot(x_i, y_i, 'r.', 'MarkerSize', 15); % Plot points with red dots
xlabel('x_i'); % Label for x-axis
ylabel('y_i'); % Label for y-axis
title('Scatter plot of x_i vs y_i'); % Title of the plot
grid on; % Enable grid
hold on;

% Linear least squares

% [a1 a0 err] = linear_least_squares(x_i, y_i);

% err
% polynomial_one = [a1 a0]

% x_linspace = linspace(-2, 20);
% y_linspace = polyval(polynomial_one, x_linspace);

% plot(x_linspace, y_linspace);

% Cubic least squares
a = cubic_least_squares(x_i, y_i)
x_linspace = linspace(-2, 20);
y_linspace = polyval(a, x_linspace);

plot(x_linspace, y_linspace);
