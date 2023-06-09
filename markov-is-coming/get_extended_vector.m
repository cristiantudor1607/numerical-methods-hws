% functie care extinde vectorul probabilitatilor
function [extended_prob] = get_extended_vector(x)
    [m, n] = size(x);
    extended_prob(1 : m, 1) = x(1 : m, 1);
    % ii adaug starea de WIN
    extended_prob(m + 1, 1) = 1;
    % ii adaug starea de LOSE
    extended_prob(m + 2, 1) = 0;
endfunction 