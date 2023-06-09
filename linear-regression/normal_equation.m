function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)

	% trebuie rezolvat sistemul A * Theta = b

	% il calculez pe A
	A = FeatureMatrix' * FeatureMatrix;
	
	% il calculez pe b
	b = FeatureMatrix' * Y;
	[m , n] = size(A);

	% initializez Theta
	Theta = zeros(n, 1);

	% testez daca matricea sistemului se pozitiv definita
	ok = positive_definite(A);
	if ok == false
		% il adaug si pe theta_0 = 0 la inceputul vectorului
		Theta = [0; Theta];
		return;
	endif

	% implementarea algoritmului din pseudocod
	r = b - A * Theta;
	v = r;
	tolerance = tol * tol;
	steps = 0;
	while steps < iter
		err = r' * r;
		if err < tolerance
			% il adaug si pe theta_0 = 0 la inceputul vectorului
			Theta = [0; Theta];
			return;
		endif
		t_k = err / (v' * A * v);
		Theta = Theta + t_k * v;
		r_prev = r;
		r = r_prev - t_k * A * v;

		s_k = (r' * r) / (r_prev' * r_prev);
		v = r + s_k * v;
		steps++;
	endwhile

	% il adaug pe 0, again
	Theta = [0; Theta];
endfunction