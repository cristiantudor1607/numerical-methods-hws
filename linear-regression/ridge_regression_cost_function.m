function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)

	% ma folosesc de functia de cost
	init_error = linear_regression_cost_function(Theta, Y, FeatureMatrix);

	new_term = sum(Theta(2 : end) .^ 2);

	Error = init_error + lambda * new_term;
endfunction