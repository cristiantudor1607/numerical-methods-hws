function [gradient_array] = get_cost_function_gradient(FeatureMatrix, Y, m, n, theta)
    % vectorul de gradienti ce trebuie returnat
    gradient_array = zeros(n, 1);

    % un vector auxiliar, care retine o valoare pentru fiecare linie
    aux_array = zeros(m, 1);

    % parcurg coloanele
    for j = 1 : n
        % calculez h_theta de x(i)
        for i = 1 : m
            h_theta(i, 1) = FeatureMatrix(i, :) * theta(:, 1);
            aux_array(i, 1) = (h_theta(i, 1) - Y(i, 1)) * FeatureMatrix(i, j);
        endfor

        gradient_array(j, 1) = (1 / m) * sum(aux_array);
    endfor

endfunction