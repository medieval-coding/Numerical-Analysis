clear
clc

A=input("entre com a matriz dos coeficientes A: ")
b=input("entre com o vetor dos resultados b: ")

[rows, cols] = size(A);
if rows <> cols then
    disp("a matriz de coeficientes A deve ser quadrada.");
return
end

if size(b, 1) <> rows then
    disp("o vetor b deve ter o mesmo número de linhas que a matriz A.");
return
end

function x=gauss_pivot(A, b)
endfunction
    n = size(A, 1)

function A=pivot(A, k)
    [n, p] = size(A);
    I = k;
    for i = k+1:n
        if abs(A(i, k)) > abs(A(I, k)) then
            I = i;
        end
    end
    if I <> k then
        aux = A(k, :);
        A(k, :) = A(I, :);
        A(I, :) = aux;
    end
endfunction

for k = 1:n-1
        A=pivot(A, k);
        for i = k+1:n
            M=A(i, k)/A(k, k);
            A(i, k:n)=A(i, k:n) - M*A(k, k:n);
            b(i)=b(i)-M*b(k);
        end
    end

    x=zeros(n, 1);
    x(n)=b(n)/A(n, n);
    for i=n-1:-1:1
        x(i)=(b(i)-A(i, i+1:n)*x(i+1:n))/A(i, i);
    end

x=gauss_pivot(A, b);
disp ("a solução do sistema do tipo Ax = b inserido é: ")
disp (x)
