function [X, y] = load_dataset(path)
	
	% caut in fisier variabilele cu numele dat
	load(path, "X", "y");

	% testez daca nu le-a gasit
	if exist("X") == 0 || exist("y") == 0
		disp("Invalid dataset.");
		X = -1;
		y = -1;
	endif

endfunction
