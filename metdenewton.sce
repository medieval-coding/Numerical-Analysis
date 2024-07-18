clc
clear

expr=input("entre com a expressão da função (na variável x) entre aspas: ")
x0=input ("entre com o chute inicial: ")
e=input ("entre com o critério de tolerância: ")
h=e*0.001

function y=f(x)
    y=evstr(expr);  
endfunction

for i=1:500 //programa definido para até 500 iterações
x1=x0-f(x0)/numderivative(f,x0)
disp (x1)

erro=abs(x1-x0)
    if erro<=e
        disp("fim do programa")
        solução=x1
    else
        x0=x1
    end
    if erro<=e
        break
        end
end

//while abs(x1-x0)>e
//    x1=x0
//    x1=x0-f(x0)/numderivative(f,x0)
//end
//end
//disp (x1)

//"log(x)") 
//no exemplo, define x0=2 e x0=fi(x0). com 5 iterações aprox. temos a raiz.
//no segundo exemplo, temos: deff("y=f(x)","y=x^2-7")e repete a fi no met. de Newton; define novo x0 e repete as iterações
