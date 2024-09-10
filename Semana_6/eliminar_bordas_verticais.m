function img_filtrada = eliminar_bordas_verticais(imagem)
  [rows, cols] = size((imread(imagem)));
  mascara = ones(rows, cols);
  mascara(:, round(cols/2)-10:round(cols/2)+10) = 0;
  figure, imshow(mascara, []);
  img_filtrada = filtra_freq(mascara);
end

