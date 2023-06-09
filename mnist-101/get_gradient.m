function [grad] = get_gradient(h_theta, X, y, m, lambda, input_layer_size, ...
                hidden_layer_size, output_layer_size, a2, Theta1, Theta2)

    K = output_layer_size;
    ys = eye(K)(:, y);

    % scaderea vector cu vector e acelasi lucru cu scaderea matricilor
    delta3s = h_theta - ys;

    DELTA2 = zeros(output_layer_size, hidden_layer_size + 1);
    
    % a2 are dimensiunile (hidden_layer_size + 1) * m, deci fiecare coloana din
    % a2 reprezinta un vector <=> (s2 + 1) * m
    % delta3s are dimensiunile K * m <=> s3 * m

    DELTA2 = delta3s * a2';

    delta2s = Theta2' * delta3s .* (a2 .* (ones(size(a2)) - a2));
    delta2s = delta2s(2 : end, :);

    DELTA1 = zeros(hidden_layer_size, input_layer_size + 1);
    DELTA1 = delta2s * X;

    theta1grad = (1 / m) * DELTA1;
    theta1grad(:, 2 : end) += (lambda / m) * Theta1(:, 2 : end);
    
    theta2grad = (1 / m) * DELTA2;
    theta2grad(:, 2 : end) += (lambda / m) * Theta2(:, 2 : end);

    grad = unsplit_params(theta1grad, theta2grad, input_layer_size, ... 
            hidden_layer_size, output_layer_size);

endfunction