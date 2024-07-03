function [A, b] = read_system(str)
    [fid, mesaj] = fopen(str, "r");
    if fid == -1
        disp(mesaj);
        return;
    endif
    n = fscanf(fid, "%d", 1);
    A = fscanf(fid, "%d", [n,n]);
    A = A';

    b = fscanf(fid, "%d", n);
endfunction
