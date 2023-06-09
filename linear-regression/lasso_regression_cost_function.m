function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)

	% ma folosesc de functia de cost
	theta_norm = sum(abs(Theta));
	sum_term = 2 * linear_regression_cost_function(Theta, Y, FeatureMatrix);
	Error = sum_term + lambda * theta_norm; 
endfunction