function imfronteira = fronteira(arquivo, tipo, Xp, Yp)
  % Ler a imagem
  img = imread(arquivo);

  % Binarizar a imagem
  img_bin = im2bw(img);

  % Criar matriz de zeros do mesmo tamanho da imagem
  [linhas, colunas] = size(img_bin);
  imfronteira = zeros(linhas, colunas);

  % Encontrar a fronteira
  for i = 2:linhas-1
    for j = 2:colunas-1
      % Verificar vizinhança
      if tipo == 0  % Fronteira interna
        if img_bin(i,j) == 1 && sum(sum(img_bin(i-1:i+1, j-1:j+1))) < 9
          imfronteira(i,j) = 1;
        end
      else  % Fronteira externa
        if img_bin(i,j) == 0 && sum(sum(img_bin(i-1:i+1, j-1:j+1))) > 0
          imfronteira(i,j) = 1;
        end
      end
    end
  end

  % Inverter a imagem para ter fundo preto e fronteira branca
  imfronteira = ~imfronteira;

  % Salvar a imagem da fronteira
  imwrite(imfronteira, 'fronteira.png');

end
