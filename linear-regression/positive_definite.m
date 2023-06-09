function [is] = positive_definite(matrix)
    is = true;

    % functia asteapta sa primeasca o matrice patratica
    [m, n] = size(matrix);
    if m ~= n
        is = false;
        disp("Square matrix needed.\n")
        return;
    endif

    for i = 1 : n
        if det(matrix(1 : i, 1 : i)) <= 0
            is = false;
            return;
        endif
    endfor
endfunction