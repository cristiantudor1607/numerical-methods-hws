function [theta1, theta2] = split_params(params, s1, s2, s3)
    % folosesc notatiile cu s1, s2 si s3 ca in document, dar ele reprezinta:
    % s1 = input_layer_size
    % s2 = hidden_layer_size
    % s3 = output_layer_size

    % theta1 : s2 * (s1 + 1)
    % theta2 : s3 * (s2 + 1)

    theta1_part = params(1 : (s2 * (s1 + 1)));
    theta2_part = params((s2 * (s1 + 1)) + 1: end);

    theta1 = reshape(theta1_part, s2, s1 + 1);
    theta2 = reshape(theta2_part, s3, s2 + 1);
endfunction