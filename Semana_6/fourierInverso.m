function fourierInverso()
  %Ler a imagem
  img = imread("barbara_gray.bmp"); 
  
  %Transformada usando Fast Fourier Transform (FFT)
  transformada = fft2(img); 
  
  %Aplicando a transformada de fourier inversa para mostrar a original
  original = ifft2(transformada);
  figure, imshow(original, [])
  
  imwrite(mat2gray(original),"destransformada.png")
end
