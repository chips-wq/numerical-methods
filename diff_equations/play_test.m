
% function out = f(t, x)
%   % x = x(t)
%   out = -x(t) + e^(-t);
% endfunction

f = @(t,x_val) (-x_val + e.^(-t));

solution = @(t) t .* e.^(-t);

x_linspace = linspace(0,10);
y_linspace = solution(x_linspace);

plot(x_linspace, y_linspace);
hold on;

x_i = 0:0.1:10;
euler_values = euler(f, 0, 0, 0.1, 100);
rk2_values = rk2(f, 0, 0, 0.1, 100);

euler_values
rk2_values
length(rk2_values)

plot(x_i, rk2_values, 'go');
plot(x_i, euler_values, 'o');
xlabel('x_i');
ylabel('sol_values');
title('Plot of x_i against sol_values');

pause;

