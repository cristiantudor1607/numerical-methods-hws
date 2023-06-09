function [Labyrinth] = parse_labyrinth(file_path)
		
		% deschid fisierul si fac un pic de "programare defensiva"
		fileID = fopen(file_path, 'r');
		err_msg = "The file is incorrect.";
		if fileID == -1
			file_path = NaN;
			disp(err_msg);
			return;
		endif

		% incarc toate datele din fisier
		read_aux = fscanf(fileID, "%f");
		
		% extrag numarul de linii si de coloane
		m = read_aux(1);
		n = read_aux(2);
		
		% fac reshape astfel incat sa revin la matricea initiala
		Labyrinth = reshape(read_aux(3: end), n, m);
		Labyrinth = Labyrinth';
		fclose(fileID);
endfunction