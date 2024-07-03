% Play file, subiect from 2017
% Integrate any polynomial of degree <= 2 from 0 to 1

one = @(x) 1;

gaussian = @(f) (1/4 * (f(0) + f(2/3)) + 1/2 * f(2/3));

f = @(x) x.^2 + 3 * x + 7;

real_integral = adaptive_simpson(f, 0, 1, 1e-9)
gaussian_result = gaussian(f)



