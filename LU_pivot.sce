clc
clear

A=input("entre com a matriz dos coeficientes A: ")
b=input("entre com o vetor b dos resultados: ")

function [M,N]=pivotAP(A,P,k)
    n=size (A,1); //pois a matriz dos coefiecientes é quadrada
    I=k;
        for i=k+1:n
            if abs(A(i,k))>abs(A(I,k)) then
                I=i;
            end
        end
    aux=A(k,:);
    aux2=P(k,:);
    A(k,:)=A(I,:);
    P(k,:)=P(I,:);
    A(I,:)=aux;
    P(I,:)=aux2;
    M=A;
    N=P;
endfunction

function [L, U] = lu_pivot(A)
    [m, n] = size(A);  
    if m <> n then
        disp ("a matriz deve ser quadrada.")
        return
    end

    L = eye(n, n);  
    U = A;          

    for k = 1:n-1
        for i = k+1:n
            L(i, k) = U(i, k) / U(k, k);
            U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
        end
    end
endfunction

[L, U] = lu_pivot(A);

//resolução de Ly = b
[p, p] = size(A)
y = zeros(p, 1);
y(1) = b(1);
for i = 2:p
    s = 0 
    for j = 1:(i-1)
        s = s + L(i, j) * y(j)
    end
    y(i) = b(i) - s;
end

//resolução de Ux = y
x = zeros(p, 1);
x(p) = y(p) / U(p, p)
for k = (p-1):-1:1
    s = 0
    for j = (k+1):p
        s = s + U(k, j) * x(j);
    end
    x(k) = (y(k) - s) / U(k, k)
end

disp("a matriz A é: ")
disp(A)
disp("a matriz triangular superior usada foi: ")
disp(U)
disp("a matriz triangular inferior usada foi: ")
disp(L)
disp("a solução encontrada é: ")
disp(x)


//A = [4, 3, 2; 2, 1, -1; 6, 7, 9];
//b = [1; 2; 3];
