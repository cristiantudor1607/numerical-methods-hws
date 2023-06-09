function [decoded_path] = decode_path(path, lines, cols)
    % explicatia formulelor este in README

    % a doua dimensiune e mereu 2
    [dim, ~] = size(path);

    % path-ul decodat o sa aiba cu 1 mai putin, pentru ca nu se mai
    % salveaza pozitia de WIN
    decoded_path = zeros(dim - 1, 2);
    for i = 1 : dim - 1
        state = path(i, 1);
        
        % gasesc j-ul
        j_idx = mod(state, cols);
        if j_idx == 0
            j_idx = cols;
        endif

        decoded_path(i, 2) = j_idx;

        % gasesc i-ul
        state = state - j_idx;
        state = state / cols;
        i_idx = 1 + state;
        decoded_path(i, 1) = i_idx;
    endfor
    
endfunction