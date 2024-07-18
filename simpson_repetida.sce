//regra do 1/3 de simpson repetida

clear
clc

expr=input("entre com a expressão da função a ser integrada entre aspas: ")
a=input("insira o limite inferior de integração (a): ");
b=input("insira o limite superior de integração (b): ");
n=input("insira o número de subintervalos (n): ");

function y = f(x)
    y = evstr(expr); 
endfunction

    if modulo(n, 2) <> 0 then
        disp("o número de subintervalos n deve ser par");
        return;
    end

function I=simp_rep(a, b, n)
h=(b - a)/ n;
sum=f(a) + f(b);

 for i=1:2:n-1
        sum=sum+4*f(a+i*h);
    end
    for i=2:2:n-2
        sum=sum+2*f(a+i*h);
    end

    I=(h/3)*sum;
endfunction

I=simp_rep(a, b, n);
disp("o valor da integral é: " + string(I));

//S1=h/3*(f(X(1))+f(X($)))
//S2=h/3*(4*sum(Y(2:2:$-1)))
//S3=h/3*(2*sum(Y(3:2:$-2)))
//
//I_S=S1+S2+S3
