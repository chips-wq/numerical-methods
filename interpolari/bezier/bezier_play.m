points = [1 1; 2 3; 3 2; 4 6; 5 5; 6 4; 7 7; 9 3; 12 7; 20 9; 22 2];
num_points = length(points)

time_linspace = linspace(0,1);

time_len = length(time_linspace);

res_linspace = zeros(time_len, 2);

for i = 1:time_len
  res_linspace(i, :) = bezier(time_linspace(i), points, 1, num_points);
endfor

plot(res_linspace(:, 1), res_linspace(:, 2));
title('Bezier Curve');
xlabel('x');
ylabel('y');

hold on;
plot(points(:, 1), points(:, 2), 'ro');
title('Points Plot');
xlabel('x');
ylabel('y');

pause;

  
