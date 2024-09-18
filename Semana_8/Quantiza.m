function img_quantizada = Quantiza(imagem, bitsY, bitsCb, bitsCr)
    imagem_YCbCr = rgb2ycbcr(imread(imagem));

    %Salvando nas matrizes separadas
    Y = imagem_YCbCr(:,:,1);
    Cb = imagem_YCbCr(:,:,2);
    Cr = imagem_YCbCr(:,:,3);

    %Quantitização separada
    function canal_quantizado = quantize_channel(canal, n_bits)
        canal_normalizado = double(canal) / 255;
        canal_quantizado = round(canal_normalizado * (2^n_bits - 1)) / (2^n_bits - 1);
        canal_quantizado = uint8(canal_quantizado * 255);
    end

    Y_quantizado = quantize_channel(Y, bitsY);
    Cb_quantizado = quantize_channel(Cb, bitsCb);
    Cr_quantizado = quantize_channel(Cr, bitsCr);

    %Combina os canais quantizados e passa para rgb
    img_quantizada = ycbcr2rgb(cat(3, Y_quantizado, Cb_quantizado, Cr_quantizado));

    imwrite(img_quantizada, 'img_quantizada.jpg');
    imshow(img_quantizada);
    title('Imagem Quantizada');
    disp(['Imagem quantizada salva como: ', 'img_quantizada.jpg']);
end
%quack = Quantiza('pimenta.tiff', 8, 2, 2);

