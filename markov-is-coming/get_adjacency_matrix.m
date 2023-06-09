function [ Adj ] = get_adjacency_matrix(Labyrinth)
    [m, n] = size(Labyrinth);
    % o stare poate sa aiba legtura cu maxim alte 4 stari, deci fiecare linie
    % ar trebui sa tina maxim 4 non-zero elements, iar ultimele 2 linii tin 
    %fiecare cate 1 element
    nz = m * n  * 4 + 2;
    
    % "rezerv" non-zerouri pentru matrice
    Adj = spalloc(m * n + 2, m * n + 2, nz);
    Adj(m * n + 1, m * n + 1) = 1;
    Adj(m * n + 2, m * n + 2) = 1;

    for i = 1 : m
        for j = 1 : n
            current = Labyrinth(i, j);
            curr_idx = n * (i - 1) + j;

            % "calculez" peretii celulei curente
            [top, bottom, right, left, ~] = get_side_walls(current);
            
            if top == 0
                % daca are legatura cu WIN
                if i == 1
                    Adj(curr_idx, m * n + 1) = 1;
                else
                    chain_idx = (i - 2) * n + j;
                    Adj(curr_idx, chain_idx) = 1;
                endif
            endif

            if bottom == 0
                % daca are legatura cu WIN
                if i == m
                    Adj(curr_idx, m * n + 1) = 1;
                else
                    chain_idx = i * n + j;
                    Adj(curr_idx, chain_idx) = 1;
                endif
            endif

            if right == 0
                % daca are legatura cu LOSE
                if j == n
                    Adj(curr_idx, m * n + 2) = 1;
                else
                    chain_idx = (i - 1) * n + (j + 1);
                    Adj(curr_idx, chain_idx) = 1;
                endif
            endif

            if left == 0
                % daca are legatura cu LOSE
                if j == 1
                    Adj(curr_idx, m * n + 2) = 1;
                else
                    chain_idx = (i - 1) * n + (j - 1);
                    Adj(curr_idx, chain_idx) = 1;
                endif
            endif

        endfor
    endfor

endfunction