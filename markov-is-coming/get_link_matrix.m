% formula: (i - 1) * n + j
function [Link] = get_link_matrix(Labyrinth)
    [m, n] = size(Labyrinth);

    % o stare poate sa aiba legtura cu maxim alte 4 stari, deci fiecare linie
    % ar trebui sa tina maxim 4 non-zero elements, iar ultimele 2 linii tin 
    %fiecare cate 1 element
    nz = m * n  * 4 + 2;
    Link = spalloc(m * n + 2, m * n + 2, nz);
    Link(m * n + 1, m * n + 1) = 1;
    Link(m * n + 2, m * n + 2) = 1;
    
    % aceeasi logica ca la adjacency matrix
    for i = 1 : m
        for j = 1 : n
            current = Labyrinth(i, j);
            curr_idx = (i - 1) * n + j;

            [top, bottom, right, left, prob] = get_side_walls(current);

            if top == 0
                if i == 1
                    Link(curr_idx, m * n + 1) = prob;
                else
                    chain_idx = (i - 2) * n + j;
                    Link(curr_idx, chain_idx) = prob;
                endif
            endif

            if bottom == 0
                if i == m
                    Link(curr_idx, m * n + 1) = prob;
                else
                    chain_idx = i * n + j;
                    Link(curr_idx, chain_idx) = prob;
                endif
            endif

            if right == 0
                if j == n
                    Link(curr_idx, m * n + 2) = prob;
                else
                    chain_idx = (i - 1) * n + (j + 1);
                    Link(curr_idx, chain_idx) = prob;
                endif
            endif

            if left == 0
                if j == 1
                    Link(curr_idx, m * n + 2) = prob;
                else
                    chain_idx = (i - 1) * n + (j - 1);
                    Link(curr_idx, chain_idx) = prob;
                endif
            endif

        endfor
    endfor

endfunction