function [matrix] = initialize_weights(L_prev, L_next)
	% daca avem 3 layere, sunt caracterizate in ordinea urmatoare: s1, s2, s3
	% matricea care face trecerea de la layerul 1 la 2 este de dimensiuni 
	% s2 * (s1 + 1) iar cea care face trecerea de la layerul 2 la 3 este de
	% dimensiuni s3 * (s2 + 1)

	% Asadar, matricea returnata de functie trebuie sa fie de forma:
	% L_next * (L_prev + 1)

	init_value = sqrt(6) / sqrt(L_next + L_prev);
	matrix(1 : L_next, 1: L_prev + 1) = -init_value + 2 * init_value * rand(L_next, L_prev + 1);
endfunction
