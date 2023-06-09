function [grad] = unsplit_params(theta1_part, theta2_part, s1, s2, s3)
    grad = zeros(s2 * (s1 + 1) + s3 * (s2 + 1), 1);

    grad(1 : s2 * (s1 + 1)) = reshape(theta1_part, s2 * (s1 + 1), 1);

    grad(s2 * (s1 + 1) + 1: end, 1) = reshape(theta2_part, s3 * (s2 + 1), 1);
endfunction