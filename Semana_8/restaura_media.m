function img_filtrada = restaura_media(imagem, N)
    img = im2double(imread(imagem));

    %Aplicar o filtro de média usando convolução 2D
    img_filtrada = imfilter(img, ones(N, N) / (N * N), 'same');
    imshow(img_filtrada);

    imwrite(img_filtrada, 'img_restaurada.jpg');
    disp(['Imagem restaurada salva como: ', 'img_restaurada.jpg']);
end
%quack = restaura_media('pimenta.tiff', 3);


