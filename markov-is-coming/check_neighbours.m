% functia returneaza 1 daca are vecini nevizitati, si 0 in caz contrar
function [ok] = check_neighbours(position, adj, visited)
    % a doua dimensiune e irelevanta, pentru ca visited e vector linie
    [n , ~] = size(visited);

    % parcurg toate coloanele de pe linia position
    for i = 1 : n
        neigh = adj(position, i);

        % verific daca e vecin
        if neigh == 1
            is_visited = visited(i);
            % verific daca a fost vizitat
            if is_visited == 0
                ok = 1;
                return;
            endif
        endif
    endfor

    % daca ajunge pana aici, ori nu are vecini, ori ii are pe toti
    % vizitati
    ok = 0;
    return;
endfunction