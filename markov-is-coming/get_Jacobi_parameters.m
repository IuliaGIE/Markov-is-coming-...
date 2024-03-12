function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  % Extragem ultima coloana din Link si o punem în vectorul c
  c = Link(1:end-2, end-1);
    
  % Extragem matricea de legaturi G din Link, facand o taietura la ultima coloana
  G = Link(:, 1:end-2);

endfunction
