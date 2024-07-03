
[A,b] = read_system("matrix.txt");

omegas = linspace(0,2, 1000);

min_steps = inf;
min_omega = -1;

for i = 1:length(omegas)
    [x,err,steps] = sor(A, b, omegas(i), 1e-9, 100);
    if steps < min_steps
        min_steps = steps;
        min_omega = omegas(i);
    endif
endfor

min_omega
min_steps
