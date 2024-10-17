function quantiza_rgb(imagem, bitsR, bitsG, bitsB)
  img = imread(imagem);

  if size(img, 3) != 3
    error('A imagem deve ser colorida');
  endif

  R = img(:, :, 1);
  G = img(:, :, 2);
  B = img(:, :, 3);

  function canal_quantizado = quantiza_canal(canal, n_bits)
    levels = 2^n_bits;
    canal_quantizado = round(canal / (256 / levels)) * (256 / levels);
  end

  R_quant = quantiza_canal(R, bitsR);
  G_quant = quantiza_canal(G, bitsG);
  B_quant = quantiza_canal(B, bitsB);

  img_quantizada = cat(3, R_quant, G_quant, B_quant);

  imwrite(uint8(img_quantizada), 'imagem_quantizada.jpg');
  imshow(uint8(img_quantizada));
  title('Imagem Quantizada');
  disp(['Imagem quantizada salva como: ', 'imagem_quantizada.jpg']);
end
%quantiza_rgb('pimenta.tiff', 8, 2, 2);

