function filtra_freq(mascara)
  %Ler a imagem
  img = imread("barbara_gray.bmp"); 
  
  %Transformada usando Fast Fourier Transform (FFT)
  transformada = fft2(img); 
  
  %Posicionando a frequencia zero no centro
  trans_shift = log(abs(fftshift(transformada))); 
  
  %Exibir e salvar o espectro de Fourier
  figure, imshow(trans_shift, []); 
  imwrite(mat2gray(trans_shift), 'espectroFourier.png');
  
  %AAplicando mascara
  trans_filtrada = trans_shift .* mascara;
  
  %Colocar o espectro novamente na posição original
  trans_reconstruida = ifftshift(trans_filtered);

  img_filtrada = abs(ifft2(trans_reconstruida));
  figure, imshow(img_filtrada, []);

  imwrite(mat2gray(img_filtrada), 'imagem_filtrada.png');
end
