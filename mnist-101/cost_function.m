function [J, grad] = cost_function(params, X, y, lambda, ...
				   input_layer_size, hidden_layer_size, ...
				   output_layer_size)

	% transform vectorul in 2 matrici
	[Theta1, Theta2] = split_params(params, input_layer_size, ...
						hidden_layer_size, output_layer_size);

	% atribui alte nume layerelor, pentru simplitatea scrierii si explicatiilor
	% s1 = input_layer_size, s2 = hidden_layer_size, s3 = output_layer_size;
	K = output_layer_size;

	[m, ~] = size(y);
	
	% vreau sa vectorizez operatia de forward propagation, analizez 
	% dimensiunile tuturor matricelor

	% Theta1 : s2 * (s1 + 1)
	% X : m * s1 (m linii cu cate s1 date de intrare)
	% adaug o coloana la inceputul lui X, numai cu elemente de 1 =>
	% X : m * (s1 + 1)

	X = [ones(m, 1) X];

	% inmultirea individuala a lui Theta1 cu fiecare linie (transpusa) din noul X
	% este echivalenta cu inmultirea lui Theta1 cu X^T

	% z2 : s2 * m
	z2 = Theta1 * X';
	
	% aplic functia de activare
	a2 = sigmoid(z2);

	% se adauga inca un element la inceputul fiecarei coloane din matrice, adica bias-ul
	% a2 : (s2 + 1) * m
	a2 = [ones(1, m); a2];

	% Theta2 : s3 * (s2 + 1)
	% a2 : (s2 + 1) * m
	% => z3 : s3 * m
	z3 = Theta2 * a2;

	% aplic functia de activare (va rezulta a3 == h_theta)
	h_theta = sigmoid(z3);

	% h_theta are m coloane, pentru fiecare dintre cele m intrari, fiecare
	% coloana reprezentant outputul

	% aflu functia de cost
	J = get_costJ(h_theta, y, m, lambda, input_layer_size, ...
				  hidden_layer_size, output_layer_size, Theta1, Theta2);

	% backpropagation
	grad = get_gradient(h_theta, X, y, m, lambda, input_layer_size, ...
						hidden_layer_size, output_layer_size, a2, Theta1, ...
						Theta2);

endfunction
