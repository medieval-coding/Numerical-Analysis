clc
clear

rotulos=["valores de X"; "valores da função"];
valores=["";""];

resp=1;
while resp==1
    U=x_mdialog("interpolação de Newton",rotulos, valores);
    
X=evstr(U(1));
Y=evstr(U(2));

n = length(X);
x = poly(0, "x"); 

A = zeros(n, n);
A(:, 1) = Y'; 

for j = 2:n
    for i = 1:n-j+1
        A(i, j) = (A(i+1, j-1) - A(i, j-1)) / (X(i+j-1) - X(i));
    end
end

P = A(1, 1);
prod = 1;

for i = 2:n
    prod = prod * (x - X(i-1));
    P = P + A(1, i) * prod;
end

disp("o polinômio de interpolação de Newton é: ");
disp(P)

disp("===============================================")
resp=messagebox("executar novamente", "modal", "info", ["sim" "não"])
end

//sugestões contra erros
//    if length(X) <> length(Y) then
//    disp("você deve apresentar o mesmo número de pontos em X e Y. insira novos valores válidos.");
//        continue;
//    end
//
//
//    if length(unique(X)) <> length(X) then
//        disp("os valores de X devem ser distintos. insira novamente..");
//        continue;
//    end

//exemplos:
//X = -1 0 3; f(x) = 15 8 -1
//X= 1 2 4; f(x) = 1, 4, 16
//X = 1, 2, 3, 4, 5; f(x) = 1, 8, 27, 64, 125
//X= -1 0 1 2 3; f(x) = 1 1 0 -1 2
