function [top, bottom, right, left, prob] = get_side_walls(code)
    % 1 se scrie ca 0001
    % daca rezultatul e 1 are perete la stanga, daca e 0 nu are
    left = bitand(code, 1);

    % 2 se scrie ca 0010
    right = bitand(code, 2);
    
    % ori iese 2, ori iese 0
    if right == 2
        right = 1;
    endif

    % 4 se scrie ca 0100
    bottom = bitand(code, 4);
    
    % ori iese 4, ori 0
    if bottom == 4
        bottom = 1;
    endif

    % 8 se scrie ca 1000
    top = bitand(code, 8);
    
    % ori iese 8, ori 0
    if top == 8
        top = 1;
    endif

    chains = top + bottom + right + left;
    chains = 4 - chains;
    prob = 1 / chains;

endfunction