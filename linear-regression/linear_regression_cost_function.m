function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
	[m, n] = size(FeatureMatrix);
	h_Theta = zeros(m, 1);

	% calculez h_theta pentru fiecare linie din i
	h_Theta = FeatureMatrix * Theta(2: end);

	% calculez diferentele, ridicate la patrat
	S = (h_Theta - Y) .^ 2;

	% calculez eroarea dupa forumla
	Error = (1 / ( 2 * m ) ) * sum(S);
	
endfunction