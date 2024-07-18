clear
clc

expr=input("entre com a expressão da função (na variável x) entre aspas: ")
a=input ("entre com o extremo esquerdo do intervalo: ")
b=input ("entre com o extremo direito do intervalo: ")
n=input ("entre com o número de subdivisões do intervalo: ")

function y=f(x)
    y=evstr(expr);  
endfunction

disp("os valores de x no intervalo são:")
X=a:(b-a)/n:b;
disp(X)

Y=f(X);
S=sign(Y);

//possível situação: sign(Y) não mudar de sinal; ou não tem raíz ou o n é muito grande
if S==1 | S==-1 & S<>0 then
    disp("não há raiz no intervalo ou o número de pontos é insuficiente")
return
end

//possível situação: raiz exata no ponto=0
raizes=find(S==0);
c_r=length(raizes);
    if raizes<>[] then
        for i=1:c_r
        printf("raiz encontrada no ponto x=%g\n",X(raizes(i)))
    
end
    end 

    
    D=diff(S);
    disp(D);
F=find (D<>0);

disp("o intervalo da raiz está entre as seguintes mudanças de sinais:")
disp(X(F))
disp(X(F+1))
