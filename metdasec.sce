clear
clc

rótulos=["função";"x0";"x1";"e"];
valores=["";"";"";""];

resp=1;
while resp==1

    U=x_mdialog("entre com a função e os demais valores", rótulos, valores);

deff ("y=f(x)", "y=evstr(U(1))");
    x0=evstr(U(2));
    x1=evstr(U(3));
    e=evstr(U(4));
    iter=0;
    
    while abs(x0-x1)>e & iter<500
        xn=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0))
        x0=x1; x1=xn;
        disp(xn);
    end
    
resp=messagebox("deseja executar novamente?","modal","question",["sim"  "não"]);
valores=[U(1);U(2);U(3);U(4)];

disp ("=======================")

end

//deff('y=f(x)','y=log(x)');
//x0=2.3;x1=2;
//e=1e-2



