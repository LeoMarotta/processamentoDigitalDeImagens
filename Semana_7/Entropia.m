function Entropia(imagem)
imagem = imread(imagem);

% Calcular o histograma da imagem (contagem de cada intensidade de cinza)
histograma = imhist(imagem);

[altura, largura] = size(imagem);
num_pixels = altura * largura;

probabilidades = histograma / num_pixels;

%Calculando a entropia
entropia = 0;
for i = 1:length(probabilidades)
  p = probabilidades(i);
  if p > 0
    entropia -= p * log2(p);
  endif
endfor

%Exibindo valor
printf("Entropia: %f\n", entropia);
endfunction
