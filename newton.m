% Método de Newton para encontrar la raíz de una ecuación
clc
fprintf('Cálculo de una raíz por el método de Newton\n');
format long
x0 = input('Ingrese el valor inicial de x; x0: ');
precis = input('Ingrese la precisión de cálculo; precis: ');
fun = input('Ingrese la función entre apóstrofes: ');
dfun = input('Ingrese la derivada de la función entre apóstrofes: ');
f=inline(fun);
df=inline(dfun);
it=0;
x=x0;
d=f(x)/df(x);
fprintf('\n %6s %7s \n','Iter.','x');
while abs(d) > precis
fprintf('\n %8.4f %8.4f \n',it,x);
x1=x-d;
it=it+1;
x=x1;
d=f(x)/df(x);
end
fprintf('\n %8.4f %8.4f \n',it,x);
