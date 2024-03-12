function [X, y] = load_dataset(path)
  % path -> a relative path to the .mat file that must be loaded
  
  % X, y -> the training examples (X) and their corresponding labels (y)
  
  % Încarcă fișierul .mat într-un struct
  data = load(path);

  % Extrage X si y din struct
  X = data.X;
  y = data.y;
endfunction
