function img_filtrada = passa_faixa(imagem)
  [rows, cols] = size(imread(imagem));
  [X, Y] = meshgrid(1:cols, 1:rows);
  centerX = cols/2;
  centerY = rows/2;
  radius_interno = 50;
  radius_externo = 80;
  mascara = (sqrt((X - centerX).^2 + (Y - centerY).^2) >= radius_interno) & (sqrt((X - centerX).^2 + (Y - centerY).^2) <= radius_externo);
  figure, imshow(mascara, []);
  img_filtrada = filtra_freq(imagem, mascara);
end
