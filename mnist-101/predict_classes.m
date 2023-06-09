function [classes] = predict_classes(X, weights, ...
									input_layer_size, hidden_layer_size, ...
									output_layer_size)
	
	[m, ~] = size(X);

	% il initializez (chiar daca nu e neaparat nevoie), ca vector coloana
	classes = zeros(m, 1);

	[Theta1, Theta2] = split_params(weights, input_layer_size, hidden_layer_size, ...
						output_layer_size);

	% adaug o coloana de 1 la inceputul matricei, ca atunci cand o transpun,
	% vectori coloana sa aibe bias-ul
	X = [ones(m, 1) X];

	% fac forward propagation
	z2 = Theta1 * X';

	a2 = sigmoid(z2);
	
	a2 = [ones(1, m); a2];

	z3 = Theta2 * a2;

	a3 = sigmoid(z3);
	
	% gasesc index-ul elementului maxim, de pe fiecare coloana
	[max_val, idx] = max(a3 , [], 1);

	classes = idx';

endfunction
