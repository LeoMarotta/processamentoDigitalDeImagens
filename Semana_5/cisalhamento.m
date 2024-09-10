function cisalhada = cisalhamento(imagem, cv, ch)
  img = imread(imagem);

  [linhas, colunas] = size(img);

  T = [ 1 ch 0;
        cv 1 0;
        0 0 1];

  img_cisalhada = uint8(zeros(linhas, colunas));

  for v = 1:linhas
    for w = 1:colunas
      [x, y] = afim(v, w, T);
      x = round(x);
      y = round(y);
      if (x >= 1 && x <= linhas && y >= 1 && y <= colunas)
        img_cisalhada(x, y) = img(v, w);
      endif
    endfor
  endfor

  cisalhada = ['cisalhada_', imagem];
  imwrite(img_cisalhada, cisalhada);

endfunction
