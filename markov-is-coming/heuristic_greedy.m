function [path] = heuristic_greedy(start_position, probabilities, Adj)
    [states, irellevant] = size(probabilities);

    path = start_position;
    visited = zeros(states, 1);
    visited(start_position) = 1;
    [n, irellevant] = size(path);
    while n > 0
        position = path(end);
        % daca starea este WIN, atunci pozitia este penultima
        if position == states - 1
            return;
        endif

        % vecinii pozitiei i se afla pe linia i din matricea de adiacenta
        ok = check_neighbours(position, Adj, visited);

        if ok == 0
            path(end) = [];
            [n, ~] = size(path);
            if n == 0
                return;
            endif
        endif

        neigh = get_neighbour(position, Adj, visited, probabilities);
        visited(neigh) = 1;
        path = [path; neigh];
    endwhile

    return;
endfunction