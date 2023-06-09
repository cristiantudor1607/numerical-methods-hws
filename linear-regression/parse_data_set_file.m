function [Y, InitialMatrix] = parse_data_set_file(file_path)

	fileID = fopen(file_path, "r");
	if fileID < 0
		disp("File not found. Please check and try again.");
		return;
	endif

	% citesc prima linie ca sa extrag dimensiunile matricii
	text = fgetl(fileID);
	[matrix_size , counted] = sscanf(text, "%d %d");
	m = matrix_size(1);
	n = matrix_size(2);

	% testez si daca formatul fisierului e bun
	if counted ~= 2
		disp("Wrong file format.");
		fclose(fileID);
		return;
	endif

	% "rezerv" memoria pentru InitialMatrix, si initializez Y-ul
	Y = zeros(m, 1);
	InitialMatrix = cell(m, n);
	for i = 1 : m
		text = fgetl(fileID);
		% extrag primul element din linie
		[aux, contor] = sscanf(text, "%d", 1);
		Y(i) = aux;

		% impart text-ul intr-un vector de string-uri, care va fi de
		% dimensiune n + 1, deoarece il cotine si pe Y(i)
		datas_arr = strsplit(text);
		InitialMatrix(i, 1: n) = datas_arr(1, 2 : n + 1);
	endfor

	fclose(fileID);

endfunction