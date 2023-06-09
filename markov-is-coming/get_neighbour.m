function [neigh] = get_neighbour(position, adj, visited, p)
    neigh = 0;  % neigh e "vecinul", adica indexul
    value = 0;  % value e probabilitatea vecinului (cea mai mare)
    [n, irellevant] = size(p);
    
    % caut maxim-ul
    for i = 1 : n
        if adj(position, i) == 1 && visited(i) == 0
            if p(i) > value
                neigh = i;
                value = p(i);
            endif
        endif
    endfor
    
endfunction