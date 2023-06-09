function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
	
	[m, n] = size(InitialMatrix);
    % numarul de linii ramane acelasi, dar mai trebuie adaugata o coloana
    % pentru ca una dintre coloane va fi impartita in 2
    FeatureMatrix = zeros(m, n + 1);

    % caut coloana cu campurile de tipul furnished - unfurnished
	idx = 0;
	for j = 1 : n
		element = InitialMatrix(1, j);
		if strcmp(element, "unfurnished")
			idx = j;
			break;
		endif

		if strcmp(element, "semi-furnished")
			idx = j;
			break;
		endif

		if strcmp(element, "furnished")
			idx = j;
			break;
		endif
	endfor

	% parcurg campurile pana la coloana cu campurile ce trebuie separate
	for i = 1 : m
        for j = 1 : idx - 1
            element = str2double(InitialMatrix(i, j));
            if isnumeric(element) == 1 && isnan(element) == 0
                FeatureMatrix(i, j) = element;
                continue;
            endif

            element = InitialMatrix(i, j);
            if strcmp(element, "yes")
                FeatureMatrix(i, j) = 1;
                continue;
            endif
        endfor
    endfor

    % parcurg coloana cu campurile ce trebuie separate
    for i = 1 : m
        if strcmp(InitialMatrix(i, idx), "unfurnished")
            FeatureMatrix(i, idx) = 0;
            FeatureMatrix(i, idx + 1) = 1;
            continue;
        endif

        if strcmp(InitialMatrix(i, idx), "semi-furnished")
            FeatureMatrix(i, idx) = 1;
            FeatureMatrix(i, idx + 1) = 0;
            continue;
        endif
    endfor

	% parcurg restul coloanelor, pana la final
	for i = 1 : m
		for j = idx + 1 : n
			element = str2double(InitialMatrix(i, j));
            if isnumeric(element) == 1 && isnan(element) == 0
                % i-ul din InitialMatrix ii corespunde lui i + 1 din
				% FeatureMatrix, dupa ce s-a facut split-ul
				FeatureMatrix(i, j + 1) = element;
                continue;
            endif

            element = InitialMatrix(i, j);
            if strcmp(element, "yes")
                FeatureMatrix(i, j + 1) = 1;
                continue;
            endif
		endfor
	endfor

endfunction