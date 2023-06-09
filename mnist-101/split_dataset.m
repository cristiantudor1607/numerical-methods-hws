function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
	
	% calculez o permutare random a liniilor
	[m, n] = size(X);
	p = randperm(m);
	
	% fac shuffle si salvez intr-o noua matrice, si un nou vector
	shuffledX = X(p, :);
	shuffledY = y(p, :);

	idx = percent * m;
	idx = round(idx);

	% separ datele in cele 2 parti
	X_train(1 : idx, 1 : n) = shuffledX(1 : idx, :);
	y_train(1 : idx, 1) = shuffledY(1 : idx, 1);

	X_test(1 : (m - idx), 1 : n) = shuffledX(idx + 1 : m, :);
	y_test(1 : (m - idx), :) = shuffledY(idx + 1 : m, :);
endfunction
