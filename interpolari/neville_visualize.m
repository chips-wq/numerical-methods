% Generate random points
x = sort((rand(1,10) - 0.5) * 50);
y = (x.^2 - (cos(x) + 1) .^ 3) .* (5+sin(x));

% Interpolate at these points
xx = linspace(min(x), max(x), 1000);
yy = (xx .^ 2 - (cos(xx) + 1) .^ 3) .* (5+sin(xx));

in_x = linspace(min(x), max(x), 1000);
n = length(in_x);
out_y = zeros(1, n);

for i = 1:n
  out_y(i) = neville(x,y,in_x(i));
endfor

% Plot the points and the interpolation
plot(in_x,out_y);
hold on;
plot(xx, yy, "g-");
% axis([min(x) - 1 max(x) + 1 min(y)-1 max(y)+1]);
