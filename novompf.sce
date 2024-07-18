clear
clc

disp("método do ponto fixo");

//try
    
expr=input("digite a função fi(x) entre aspas: ");
x0=input("digite o chute inicial: ");
tol=input("digite o critério de tolerância: ")
maxiter=input("digite o número máximo de iterações: ")

////try
//        func=evstr(expr);
////    catch
//        error("a função inserida é inválida. certifique-se de que foi digitada corretamente");
////    end

function y=f(x)
    y=evstr(expr);  
endfunction

 iter=0;
    x=x0;
    x1=f(x0);
    
    //pode ser adicionado comando para exibir todas as iterações feitas pelo programa
    
    while abs(x1-x0)>=tol && iter<maxiter
        x0=x1;
        x1=f(x0);
        iter=iter+1;
    end
    
    raiz=x1;
    
 if iter==maxiter
        disp("o método não convergiu dentro do número máximo de iterações")
    else
printf("a raiz aproximada é´%g\n encontrada na iteração %g",raiz,iter)
    end
//    catch
//    disp("ocorreu um erro. verifique se a função foi digitada corretamente e se os valores de entrada são válidos")
//end


//exemplo que não converge no método: "log(x)/x^2+x", 0.5, 1e-6, 100
//exemplo onde o valor não é um número (tende a infinito): "x^2-1/4*x+2", 1.5, 1e-10, 200
//exemplo testado que converge em raiz conhecida (2): "sqrt(x+2)",2.3,1e-10,50
//exemplo para a função x^2+x-6=0: fi(x) que converge "6/x+1", 1.3,1e-6,100 | fi(x) que não converge "6-x^2"
//exemplo que Mizaiane fez no quadro (intervalo de 1 até 2): "x^1/3+1",1,1e-10,100 ---> raiz aproximada 1.5

//possibilidade de adesão ao programa: comando que exibe todas as iterações feitas: disp("iteração |    x0    |    x1    |   |x1-x0| ");
//disp("---------------------------------------------");
//disp(iter, x0, x1, abs(x1-x0));

//possibilidade de adesão ao programa: estrutura try-catch para identificar erros (linhas 6 e 42-44 para verificar erros em toda a iteração, linhas 13-17 para verificar validade da função)
//a estrutura try-catch não funcionou corretamente no nosso programa
