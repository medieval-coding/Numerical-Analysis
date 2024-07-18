//interpolação de Lagrange

clc 
clear

rotulos=["valores de X"; "valores da função"];
valores=["";""];

resp=1;
while resp==1
    U=x_mdialog("interpolação de Lagrange",rotulos, valores);
    
X=evstr(U(1));
Y=evstr(U(2));

n=length(X);
x=poly(0, "x");
for k=1:n
    Prod=1;
    for i=1:n
        if i<>k then
            Prod=Prod*(x-X(i))/(X(k)-X(i))
        end
    end
    L(k)=Prod;
end
P=0
for i=1:n
    P=P+Y(i)*L(i)
end

disp("o polinômio de Lagrange é que aproxima a função definida nestes pontos é: ");
disp(P)

disp("=================================================")
resp=messagebox("executar novamente", "modal", "info", ["sim" "não"])
end
