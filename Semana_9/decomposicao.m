function [red, green, blue] = decomposicao(img)
  img = imread(img);
  if size(img, 3) != 3
    error('A imagem deve ser colorida');
  endif

  r = img(:, :, 1);
  g = img(:, :, 2);
  b = img(:, :, 3);

  vazia = zeros(size(img, 1), size(img, 2));
  red = cat(3, r, vazia, vazia);
  green = cat(3, vazia, g, vazia);
  blue = cat(3, vazia, vazia, b);

  imwrite(red, 'vermelha.jpg');
  imwrite(green, 'verde.jpg');
  imwrite(blue, 'azul.jpg');
  figure;
  subplot(1, 3, 1), imshow(red), title('Vermelho');
  subplot(1, 3, 2), imshow(green), title('Verde');
  subplot(1, 3, 3), imshow(blue), title('Azul');
end
%decomposicao('pimenta.tiff');

