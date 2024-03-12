function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  % Labyrinth -> the matrix of all encodings
%
% Adj -> the adjacency matrix associated to the given labyrinth

% Determinam dimensiunile matricei date
[m, n] = size(Labyrinth);

% Initializam matricea Adj conform cerintelor
Adj = zeros(m*n + 2, m *n + 2);

% Generam matricea Adj
for i = 1:m
    for j = 1:n
	    win = m * n + 1;
	    lose = m * n + 2;
        curr = Labyrinth(i,j);
        curr_index = (i-1)*n + j;
        
        % Verificam peretii celulei curente pentru a determina
        % care celule adiacente pot fi accesate
        
	    % Verificam Starea Castig-Nord
        if bitget(curr, 4) == 0 && i == 1
            index = j;
            Adj(index, win) = 1;
            Adj(win, win) = 1;
        end

        % Verificam Starea Castig-Sud
        if bitget(curr, 3) == 0 && i == m
            Adj(curr_index, win) = 1;
            Adj(win, win) = 1;
        end

	    % Verificam Starea Pierdere-Est
        if bitget(curr, 2) == 0 && j == n
            index = j;
            Adj(lose, lose) = 1;
            Adj(j * i, lose) = 1;
        end

        % Verificam Starea Pierdere-Vest
        if bitget(curr, 1) == 0 && j == 1
            Adj(curr_index, lose) = 1;
            Adj(lose, lose) = 1;
        end

        % Verificam peretele Nord
        if bitget(curr, 4) == 0 && i > 1
            north = Labyrinth(i-1, j);
            north_index = (i-2)*n + j;
            Adj(curr_index, north_index) = 1;
            Adj(north_index, curr_index) = 1;
        end
        
        % Verificam peretele Sud
        if bitget(curr, 3) == 0 && i < m
            south = Labyrinth(i+1, j);
            south_index = i*n + j;
            Adj(curr_index, south_index) = 1;
            Adj(south_index, curr_index) = 1;
        end
        
        % Verificam peretele Est
        if bitget(curr, 2) == 0 && j < n
            east = Labyrinth(i, j+1);
            east_index = (i-1)*n + j + 1;
            Adj(curr_index, east_index) = 1;
            Adj(east_index, curr_index) = 1;
        end
        
        % Verificam peretele Vest
        if bitget(curr, 1) == 0 && j > 1
            west = Labyrinth(i, j-1);
            west_index = (i-1)*n + j - 1;
            Adj(curr_index, west_index) = 1;
            Adj(west_index, curr_index) = 1;
        end
    end
end

[m, n] = size(Adj);
Link = zeros(m, n);
for i = 1:m
        % Facem suma pe fiecare linie
        row_sum = sum(Adj(i, :));
        for j = 1:n
            % Verificam daca elementul Adj(i,j) este 1
            if Adj(i, j) == 1
                % Incarcam matricea Link cu valori
                Link(i, j) = 1/row_sum;
            end
        end
    end
  
endfunction
