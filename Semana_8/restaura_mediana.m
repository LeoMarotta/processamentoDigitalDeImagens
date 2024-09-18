function img_filtrada = restaura_mediana(imagem, N)
    img = imread(imagem);

    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    %Aplicar o filtro de mediana com janela NxN
    img_filtrada = medfilt2(img, [N, N]);
    imshow(img_filtrada);

    imwrite(img_filtrada, 'img_restaurada.jpg');
    disp(['Imagem restaurada salva como: ', 'img_restaurada.jpg']);
end
%quack = restaura_mediana('pimenta.tiff', 3);

