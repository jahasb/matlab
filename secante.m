%M�todo de la Secante para encontrar la ra�z de una ecuaci�n
clear all
clc;
fprintf('C�lculo de una ra�z por el m�todo de la Secante \n');
f=input('Ingresar la funcion f(x) : ','s');
x0=input('Ingresar el primer valor inicial de x; x0: ');
x1=input('Ingresar el primer valor inicial de x; x1: ');
precis=input('Ingrese la precisi�n de c�lculo; precis: ');
error=100;
it=0;
fprintf('\n %8s %7s %7s %7s \n','Iter.','x0','x1','xi');
while abs(error)>precis
x=x0;
g=eval(f);
x=x1;
gg=eval(f);
xi=x1-((gg*(x0-x1))/(g-gg));
error=abs(xi-x1)
fprintf('\n %8.4f %8.4f %8.4f %8.4f \n',it,x0,x1,xi);
x0=x1;
x1=xi;
it=it+1;
end
fprintf('\n %8.4f %8.4f %8.4f %8.4f \n',it,x0,x1,xi);