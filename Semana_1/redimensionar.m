function saida = redimensionar(arquivo, tipo, nx, ny) % Estabelecer o metodo

    I = imread(arquivo);  % Ler o arquivo

    % Obter o tamanho da imagem original
    [H W]=size(I);
    % Calcular o novo tamanho da imagem
    WR = W*nx;
    HR = H*ny;
    % Criar uma nova imagem com o novo tamanho
    % preenchendo os vazios com zero
    R = zeros(HR,WR);

    if tipo == 1 % Vizinho mais proximo
      for(j=1:1:HR)
        for(i=1:1:WR)
          R(i,j)=I(floor((i-1)/nx)+1,floor((j-1)/ny)+1);
        end
      end

    elseif tipo == 2
      for(j=1:1:HR)
        for(i=1:1:WR)
          % Coordenadas na imagem original
          X = (i - 1) / (WR - 1) * (W - 1) + 1;
          Y = (j - 1) / (HR - 1) * (H - 1) + 1;

          % Encontrar os quatro pixels mais próximos
          x1 = floor(X);
          y1 = floor(Y);
          x2 = ceil(X);
          y2 = ceil(Y);

          % Limitar os valores aos limites da imagem original
          x1 = min(max(x1, 1), W);
          x2 = min(max(x2, 1), W);
          y1 = min(max(y1, 1), H);
          y2 = min(max(y2, 1), H);

          % Calcular os pesos para a interpolação
          R1 = (x2 - X) * I(y1, x1) + (X - x1) * I(y1, x2);
          R2 = (x2 - X) * I(y2, x1) + (X - x1) * I(y2, x2);
          R(j, i) = (y2 - Y) * R1 + (Y - y1) * R2;
        end
      end
    end

    % Converter a imagem redimensionada para uint8
    saida = uint8(R);

    % Criar o nome do novo arquivo
    [path, name, ext] = fileparts(arquivo);
    novo_arquivo = fullfile(path, [name '_redimensionada' ext]);

    % Escrever a nova imagem no arquivo
    imwrite(saida, novo_arquivo);

    % Retornar o nome do novo arquivo
    saida = novo_arquivo;

end
