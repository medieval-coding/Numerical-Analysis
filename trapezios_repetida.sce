//regra dos trapézios repetida

clear
clc

expr=input("entre com a expressão da função a ser integrada entre aspas: ")
a=input("insira o limite inferior de integração (a): ");
b=input("insira o limite superior de integração (b): ");
n=input("insira o número de subintervalos (n): ");

function y = f(x)
    y=evstr(expr);  
endfunction

function I=trap_rep(f, a, b, n)
    h=(b - a)/ n;
    X=a:h:b;
    p=length(X); 
    y=zeros(p, 1);
    for i=1:p
        y(i)=f(X(i));
    end
    I=(h / 2) * (y(1) + 2 * sum(y(2:$-1)) + y($));
endfunction

I=trap_rep(f, a, b, n);

disp("o valor da integral é: ");
disp(I);

//(ex: x^2 + 1)
