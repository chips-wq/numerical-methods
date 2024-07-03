% Random points between, -50 and 50
x = sort((rand(1,50) - 0.5) * 100);
y = (x.^2 - (cos(x) + 1) .^ 3) .* (5+sin(x));
% x = [x0...xn]
% y = [y0...yn]
xx = linspace(min(x), max(x), 1000);
yy = (xx .^ 2 - (cos(xx) + 1) .^ 3) .* (5+sin(xx));

plot(x,y,'bo');
hold on;
plot(xx,yy, "g-");

S = spline_c2(x,y);

n = length(x);


% Plot each spline for all points according to each spline
for i = 1:n-1
  in_x = linspace(x(i), x(i+1));
  out_y = polyval(S(:, i), in_x - x(i));
  plot(in_x, out_y);
endfor


