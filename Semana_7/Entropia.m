function Entropia(imagem)
imagem = imread(imagem);

%Criando o histograma
[hist, bins] = hist(img(:), 0:255);

%Normalizar o histograma para obter a probabilidade de cada nível de cinza
total_pixels = numel(img);
probabilities = hist / total_pixels;

%Adicionar uma pequena constante para evitar log(0)
epsilon = 1e-10;
probabilities = probabilities + epsilon;

%Calculando a entropia
entropia = -sum(probabilities .* log2(probabilities));

%Exibindo valor
printf("Entropia: %f\n", entropia);
endfunction
