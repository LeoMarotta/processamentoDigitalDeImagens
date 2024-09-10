function fourier()
  %Ler a imagem
  img = imread("barbara_gray.bmp"); 
  
  %Transformada usando Fast Fourier Transform (FFT)
  transformada = fft2(img); 
  
  %Módulo
  trans_abs = abs(transformada); 
  figure, imshow(trans_abs, []);
  
  %Para valores altos
  trans_log = log(trans_abs); 
  figure, imshow(trans_log, []); 

  %Posicionando a frequencia zero no centro
  trans_shift = log(abs(fftshift(transformada))); 
  figure, imshow(trans_shift, []);

  imwrite(mat2gray(trans_shift),"transformadaDeFourier.png")
end
