function [Y, InitialMatrix] = parse_csv_file(file_path)

	% testez daca fisierul exista
	fileID = fopen(file_path, "r");
	if fileID < 0
		disp("File not found. Please check and try again.");
		Y = -1;
		InitialMatrix = -1;
		return;
	endif

	% citesc prima linie, si numar cate coloane sunt
	text = fgetl(fileID);
	data = strsplit(text, ',');
	[~, n] = size(data);

	i = 1;
	% citesc pana la finalul fisierului
	while !feof(fileID)
		text = fgetl(fileID);
		data = strsplit(text, ',');
		y = str2double(data(1,1));
		Y(i, 1) = y;
		InitialMatrix(i, 1 : n - 1) = data(1, 2 : n);
		i++;
	endwhile
endfunction