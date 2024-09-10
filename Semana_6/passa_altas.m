function img_filtrada = passa_altas(imagem)
  [rows, cols] = size(imread(imagem));
  [X, Y] = meshgrid(1:cols, 1:rows);
  centerX = cols/2;
  centerY = rows/2;
  radius = 10;
  mascara = sqrt((X - centerX).^2 + (Y - centerY).^2) > radius;
  figure, imshow(mascara, []);
  img_filtrada = filtra_freq(mascara);
end

