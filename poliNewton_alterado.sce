//This version of the Newton polynomial interpolation includes the option for the user to choose between add the expression of the function or add the vector Y of the results. 

clc
clear

rotulos=["valores de X"; "valores da função"];
valores=["";""];

resp=1;
while resp==1
    escolha=messagebox("deseja usar a expressão da função?", "modal", "info", ["sim" "não"]);
    
    if escolha==1 
        U=x_mdialog("interpolação de Newton", ["expressão da função"], [""]);
        funcao_str = U(1);
        funcao = str2func(['@(x)' funcao_str{1}]); 
        
        U=x_mdialog("interpolação de Newton", ["valores de X"], [""]);
        X=evstr(U(1));
        
        Y = funcao(X);
    else
        U=x_mdialog("interpolação de Newton", rotulos, valores);
        X=evstr(U(1));
        Y=evstr(U(2));
    end
    
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
    resp=messagebox("executar novamente", "modal", "info", ["sim" "não"]);
end
