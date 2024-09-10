function [x, y] = afim(v, w, T)

  coordenadas = [v; w; 1];

  resultado = T * coordenadas;

  x = resultado(1);
  y = resultado(2);
endfunction
