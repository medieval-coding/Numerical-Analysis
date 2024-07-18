clc
clear

n=input("insira o número de linhas/colunas da matriz quadrada: ");
e=input("insira o valor de precisão: ");
Nmax=input("insira o número máximo de de iterações: ");

A=zeros(n, n);
b=zeros(n, 1);
x0=zeros(n, 1);
n=size(A,1);

for i = 1:n
    for j = 1:n
        A(i, j) = input("insira o valor para o elemento na linha " + string(i) + ", coluna " + string(j) + ": ");
    end
    b(i) = input("insira o valor do vetor b " + string(i) + ": ");
    x0(i) = input("insira o valor da aproximação inicial x0 " + string(i) + ": ");
end

disp("a matriz A: ");
disp(A);
disp("e o vetor b é:");
disp(b);

check = 1;
for i = 1:n
    soma=sum(abs(A(i, :))) - abs(A(i, i)); 
    if abs(A(i, i)) <= soma then
        check = 0;
        break;
    end
end

if check == 1 then
    disp("matriz satisfaz o critério das linhas!");
else
    disp("a matriz não satisfaz o critério das linhas");
    return
end

C=zeros(n, n);
g=zeros(n, 1);

for i = 1:n
    C(i, :) = -A(i, :) / A(i, i);
    C(i, i) = 0;  
    g(i) = b(i) / A(i, i);
end

x1 = C * x0 + g;
d = max(abs(x1 - x0)) / max(abs(x1));
cont=1;

while d > e & cont < Nmax
    x0 = x1;
    x1 = C * x0 + g;
    d = max(abs(x1 - x0)) / max(abs(x1));
    cont=cont + 1;
end

disp("a solução para o sistema linear é: ");
disp(x1);
disp("encontrada com o número de iterações abaixo: :");
disp(cont);

//exemplo de uso:
//n=3;
//A=[10 -1 2; -1 11 -1; 2 -1 10];
//b=[6; 25; -11];
//x0=[0; 0; 0];
//e=1e-6;
//Nmax=100;
