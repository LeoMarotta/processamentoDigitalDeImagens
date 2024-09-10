function [D4, D8, DE, DM] = distancias(arquivo, Xp, Yp, Xq, Yq)
  % Ler a imagem
  img = imread(arquivo);

  % Binarizar a imagem
  img_bin = im2bw(img);

  % Coordenadas dos pixels
  P = [Xp, Yp];
  Q = [Xq, Yq];

  % Calcular Distância D4 (Manhattan)
  D4 = abs(Xp - Xq) + abs(Yp - Yq);

  % Calcular Distância D8 (Chebyshev)
  D8 = max(abs(Xp - Xq), abs(Yp - Yq));

  % Calcular Distância Euclidiana DE
  DE = sqrt((Xp - Xq)^2 + (Yp - Yq)^2);

  % Verificar conectividade e calcular DM
  if img_bin(Yp, Xp) == img_bin(Yq, Xq)
    % Os pixels têm o mesmo valor (ambos 0 ou ambos 1)
    % Calcular DM como a menor das distâncias calculadas
    DM = min([D4, D8, DE]);
  else
    % Os pixels têm valores diferentes, não há conectividade
    DM = Inf;
  end

  % Salvar a imagem binarizada (opcional)
  imwrite(img_bin, 'imagem_binaria.png');
end

