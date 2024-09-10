function nova_figura = contraste(figura)
    img = imread(figura);

    % Exibir histograma da imagem original
    figure;
    imhist(img);
    title('Histograma da Imagem Original');

    % Alargar o contraste da imagem
    img_alargada = imadjust(img, stretchlim(img), [0 1]);

    % Salvar o arquivo modificado
    imwrite(img_alargada, 'imagem_contraste_alargado.png');

    % Exibir histograma da nova imagem
    figure;
    imhist(img_alargada);
    title('Histograma da Imagem com Contraste Alargado');

    % Retornar o nome do arquivo gerado
    fprintf('Nova imagem salva como: %s\n', nova_figura);
end

