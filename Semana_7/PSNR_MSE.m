function PSNR_MSE(imagem1, imagem2)
imagem1 = imread(imagem1);
imagem2 = imread(imagem2);

%VerificaNDO se as imagens têm a mesma resolução
  if size(imagem1) != size(imagem2)
    return;
  endif

[altura, largura] = size(imagem1);
mse = 0;

%Calculando o MSE
for i = 1:altura
  for j = 1:largura
    erro = double(imagem1(i, j)) - double(imagem2(i, j));
    mse += erro^2;
  endfor
endfor

%Dividir pelo número total de pixels para obter a média
mse = mse/(altura * largura);

%Calculando o PSNR
max_pixel = 255;
if mse == 0
  psnr = Inf;  %Tratamento para quando mse = 0;
else
  psnr = 10 * log10((max_pixel^2) / mse);
endif

%Exibindo valores
printf("PSNR: %f dB\n", psnr);
printf("MSE: %f\n", mse);

endfunction

