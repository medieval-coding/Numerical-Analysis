clc
clear

matriz=input("entre com a matriz: ")
b= input ("entre com o valor do vetor: ")
x=input("entre com as aproximações iniciais: ")
E=input("entre com o critério de precisão: ")
Nmax=input("entre com o número máximo de iterações: ")

P=0
m=size(matriz,1)
n=size(matriz,2)
L=zeros(m,n)
D=zeros(m,n)
R=zeros(m,n)
I=eye(m,n)
matrizz=[matriz b]

disp("a representação da matriz é: ")
disp(matrizz)
// tratamento matricial
disp("+++++++++++++++")
for i= 1:n
   a= matriz(i,i) 
   L(i+1:n,i)= matriz(i+1:m,i)
   D(i,i)= matriz(i,i)
   R(i,i+1:n)=matriz(i,i+1:n)
end
//divisão de cada termo pelo termo que corresponde ao valor diferente de zero na na matriz com a diagonal principal
b=inv(D)*b
R=inv(D)*R
L= inv(D)*L
T=R+L //soma das matrizes triagulares, matendo a diagonal principal nula
disp(" a representação da matriz diagonal principal,vetor, triang. superior, inferior e matriz com diagonal prin zero")
disp(D)
disp(b)
disp(L)
disp(R)
disp(T)
disp("+++++++++++++")

//critério de Sassenfeld
beta=ones(m,1)
for v= 1:m
    Beta=abs(T(v,:))*beta //produto de matriz linha com matriz coluna
    beta(v)=Beta
end
M=max(beta)
disp("o valor de beta é: ")
disp(M)
if M<=1 then
    disp("o sistema de equações é convergente!")
else
    disp("o sistema de equações é divergente.")
end

//resolvendo a matriz
x0=x
for j=1:n
   X=b(j)-T(j,:)*x //produro de matriz linha com matriz coluna
   x(j)=X     
end
d=max(abs(x-x0))/max(abs(x))
P=P+1
while d>E
x1=x
   for k=1:n
   X=b(k)-T(k,:)*x
   x(k)=X     
end
d=max(abs(x-x1))/max(abs(x))
P=P+1
if  P>Nmax
   return 
   end
end

disp("a solução encontrada é: ")
disp(x)
disp("o número de iterações foi: " + string(P))

