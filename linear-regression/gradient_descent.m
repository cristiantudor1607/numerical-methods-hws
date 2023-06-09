function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)

	Theta = zeros(n, 1);
	for k = 1 : iter
		J_grad = get_cost_function_gradient(FeatureMatrix, Y, m, n, Theta)
		Theta = Theta - alpha * J_grad;
	endfor

	% theta este acum de forma [theta1, theta2, theta3, ...]
	% dar trebuie adaugat la inceput si theta0, pentru a putea fi folosit mai
	% departe, care este considerat 0 
	Theta = [0; Theta];
endfunction