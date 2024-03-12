function [Labyrinth] = parse_labyrinth(file_path)
  % Deschide fisierul pentru citire
  fileID = fopen(file_path,'r');
  
  % Citeste dimensiunile labirintului
  dims = fscanf(fileID, '%d %d', [1 2]);
  m = dims(1);
  n = dims(2);
  
  % Initializează matricea labirintului
  Labyrinth = zeros(m,n);
  
  % Citeste codificarile zidurilor pentru fiecare rand al labirintului
  for i = 1:m
    row = fscanf(fileID, '%d', [1 n]);
    Labyrinth(i,:) = row;
  end
  
  % Închide fisierul
  fclose(fileID);
end
