clc
clear

rotulos=["função"; "a";"b";"tolerância";"numero de iteração"];
valores=["";"";"";"";""];
resp=1;
while resp==1
    
    U=x_mdialog("método da bissecção",rotulos, valores);
a=evstr(U(2))
b=evstr(U(3))
tol=evstr(U(4));
deff("y=f(x)","y=evstr(U(1))");
n=evstr(U(5))

    while f(a)*f(b)>0
        printf("raiz inexistente no intervalo \n");
        rot=["a";"b"]
        val=["";""]
         UU=x_mdialog("entre com outros intervalos",rot, val)
         a=evstr(UU(1));
         b=evstr(UU(2));
    end

    if f(a)*f(b)==0 then
        
        if f(a)==0
            printf("raiz da funcao.",a);
        else
            printf(" raiz da funcao. %g\n",b);
        end
        return        
    end

m=0;
while abs(b-a)>=tol & m<n
    x=(a+b)/2;
    m=m+1;
    p=f(x);
            if abs(p)==0 then
            printf("a raiz aproximada é %g\n",x);
            return
        end
        if f(x)*f(a)>0 then
            a=x;
        else
            b=x;
        end
        
end

printf("a raiz aproximada: %g.\n",x);
disp("=================================================================")
resp=messagebox("executar novamente", "modal", "info", ["sim" "não"])
end
