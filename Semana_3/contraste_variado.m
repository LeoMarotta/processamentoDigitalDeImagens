function contraste_variado(figura)
    imagem = imread(figura);
    imagem_linear_identidade = imagem;

    % Transformação de intensidade linear com ajuste variando entre min e max
    min_val = double(min(imagem(:)))/255;
    max_val = double(max(imagem(:)))/255;
    imagem_linear_ajustada = imadjust(imagem, [min_val max_val], [0 1]);

    % Correção gama para valores de gama < 1, gama = 1, gama > 1
    imagem_gama_05 = imadjust(imagem, [], [], 0.5);
    imagem_gama_1 = imadjust(imagem, [], [], 1);
    imagem_gama_2 = imadjust(imagem, [], [], 2);

    % Salvar as imagens transformadas
    imwrite(imagem_linear_identidade, 'imagem_linear_identidade.png');
    imwrite(imagem_linear_ajustada, 'imagem_linear_ajustada.png');
    imwrite(imagem_gama_05, 'imagem_gama_0.5.png');
    imwrite(imagem_gama_1, 'imagem_gama_1.png');
    imwrite(imagem_gama_2, 'imagem_gama_2.png');

    % Crime da programação a seguir
    figure;
    subplot(3, 4, 1);
    imshow(imagem_linear_identidade);
    title('Linear Identidade');
    subplot(3, 4, 2);
    imshow(imagem_gama_05);
    title('Gama 0.5');
    subplot(3, 4, 3);
    imshow(imagem_gama_1);
    title('Gama 1');
    subplot(3, 4, 4);
    imshow(imagem_gama_2);
    title('Gama 2');
    subplot(3, 4, 5);
    imhist(imagem_linear_identidade);
    title('Histograma Identidade');
    subplot(3, 4, 6);
    imhist(imagem_gama_05);
    title('Histograma Gama 0.5');
    subplot(3, 4, 7);
    imhist(imagem_gama_1);
    title('Histograma Gama 1');
    subplot(3, 4, 8);
    imhist(imagem_gama_2);
    title('Histograma Gama 2');
    subplot(3, 4, [9, 10]);
    imshow(imagem_linear_ajustada);
    title('Linear Ajustada');
    subplot(3, 4, [11, 12]);
    imhist(imagem_linear_ajustada);
    title('Histograma Ajustada');

    fprintf('Imagens salvas e visualizadas com histogramas.\n');
end


