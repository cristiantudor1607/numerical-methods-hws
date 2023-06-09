function [G, c] = get_Jacobi_parameters(Link)
    [k, ~] = size(Link);
    G = Link(1 : (k - 2), 1 : (k - 2));

    c = Link(1 : (k - 2), k - 1);
endfunction