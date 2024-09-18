function modelosRuido(imagem)
    img = im2double(imread(imagem));

    figure;
    %Ruído gaussiano com média 0 e variância 0.01;
    subplot(2, 3, 1), imshow(imnoise(img, 'gaussian', 0, 0.01)), title('Gaussiano 0 e 00.1)');
    %Ruído gaussiano com média 30 e variância 0.01;
    subplot(2, 3, 2), imshow(imnoise(img + 30/255, 'gaussian', 0, 0.01)), title('Gaussiano 30 e 0.01)');
    %Ruído gaussiano com média 50 e variância 0.05;
    subplot(2, 3, 3), imshow(imnoise(img + 50/255, 'gaussian', 0, 0.05)), title('Gaussiano 50 e 0.05)');
    %Ruído com distribuição de Poisson;
    subplot(2, 3, 4), imshow(imnoise(img, 'poisson')), title('Poisson');
    %Ruído sal-e-pimenta afetando 2% dos pixels;
    subplot(2, 3, 5), imshow(imnoise(img, 'salt & pepper', 0.02)), title('Sal-e-pimenta 2%');
    %Ruído sal-e-pimenta afetando 10% dos pixels.
    subplot(2, 3, 6), imshow(imnoise(img, 'salt & pepper', 0.10)), title('Sal-e-pimenta 10%');

    imwrite((imnoise(img, 'salt & pepper', 0.10)),'pimenta_com_ruido.jpg')
endfunction
%modelosRuido("pimenta.tiff");

