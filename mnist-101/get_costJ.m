function [ J ] = get_costJ(h_theta, y, m, lambda, input_layer_size, ...
                hidden_layer_size, output_layer_size, Theta1, Theta2)

    % initializez J-ul
    J = 0;

    % transform outputurile intr-o matrice de forma lui h_theta, cu m vectori
    % coloana
	K = output_layer_size;
	ys = eye(K)(:, y);
	one = ones(size(ys));

	% prima componenta a sumei
	B = -ys .* log(h_theta) - (one - ys) .* log(one - h_theta);
	J += (1 / m) * sum(sum(B));

    % calculez a doua componenta a sumei

	% sumele se fac pe coloana, incepand de la a doua coloana
	% Suma este de fapt suma patratelor elementelor, exceptand coloana
	% 1 din ambele matrici
	S = 0;

	S += sum(sum(Theta1(:, 2 : end) .^ 2));
	S += sum(sum(Theta2(:, 2 : end) .^ 2));

    % adaug a doua componenta la suma
	J += (lambda / (2 * m )) * S;

endfunction