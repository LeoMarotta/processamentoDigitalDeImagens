function [H, S, I] = rgb_hsi(img)
  img = imread(img);

  if size(img, 3) != 3
    error('A imagem deve ser colorida');
  endif

  img = im2double(img);

  R = img(:, :, 1);
  G = img(:, :, 2);
  B = img(:, :, 3);

  soma = R + G + B;
  r = R ./ (soma + eps);
  g = G ./ (soma + eps);
  b = B ./ (soma + eps);

  [rows, cols] = size(R);
  H = zeros(rows, cols);
  S = zeros(rows, cols);
  I = zeros(rows, cols);

  % Hue(H)
  num = 0.5 * ((r - g) + (r - b));
  den = sqrt((r - g).^2 + (r - b).*(g - b));
  theta = acos(num ./ (den + eps));
  H = theta;
  H(b > g) = 2 * pi - theta(b > g);
  H = H / (2 * pi);

  % Saturação (S)
  min_val = min(min(r, g), b);
  S = 1 - 3 * min_val;

  % Intensidade (I)
  I = soma / 3;

  imwrite(H, 'hue.jpg');
  imwrite(S, 'saturação.jpg');
  imwrite(I, 'intensidade.jpg');
  figure;
  subplot(1, 3, 1), imshow(H), title('Matiz (H)');
  subplot(1, 3, 2), imshow(S), title('Saturação (S)');
  subplot(1, 3, 3), imshow(I), title('Intensidade (I)');
end
%>> rgb_hsi('pimenta.tiff');


