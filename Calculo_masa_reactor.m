%Script para estimar la cantidad de masa que sale o ingresa en un reactor,mediante la interpolación para hallar la función aproximada de los datos, además del uso del método de simpsons para la integración. 
%V= Velocidad
%A=área de la sección transversal
%Q=Caudal del fluido
%M=masa

clear all ; 
clc;
disp('-------Cálculo de la masa que sale o ingresa en un reactor-------');
V= input('Ingrese el valor de la velocidad en m/min: \n ');
D=input('Ingrese el valor del diámetro en m: \n');
A=pi*(D^2/4);
Q=A*V;
fprintf('El valor del caudal es:\n');
Q
 %m=input('Ingrese el número de datos por fila\n');
 n=input('Ingrese el número de datos por fila \n');
 disp('Ingrese los valores del tiempo en min')

 for i = 1
     for j=1:n
   disp(['El elemento:',num2str(j)])
          t(i,j) =input('');
     end
 end
 %disp('Valores del  tiempo:')
 t
 n;
 disp('Ahora ingrese los valores de la densidad en mg/m3:')
 for i = 1
     for j=1:n
   disp(['El elemento:',num2str(j)])
          ro(i,j) =input('');
     end
 end
 disp('Valores de la densidad:')
 ro
fprintf('El polinomio aproximado a los puntos es:\n')
w=length(t);
o=w-1;
L=zeros(w,w);
for k=1:o+1
V=1;
for j=1:o+1
if k~=j
V=conv(V,poly(t(j)))/(t(k)-t(j));
end
end
L(k,:)=V;
end
R=L;
C=ro*R
% Graficación:
m=length(t)-1;
xp=1:0.1:50;
yp=zeros(size(xp));
for k=1:m+1
yp=yp+C(k)*xp.^(m+1-k);
end
plot(xp,yp,t,ro,' o')
xlabel('Tiempo(t)')
ylabel('Densidad(mg/m3)')
title('GRÁFICA DE LA FUNCIÓN')
pretty(poly2sym(C))
% xp=0:10:40;
% yp=0:10:60;
% for k=1:m+1
% yp=yp+C(k)*xp.^(m+1-k);
% end
% plot(xp,yp,t,ro,' o')
% xlabel('Tiempo(t)')
% ylabel('Densidad(mg/m3)')
% title('GRÁFICA DE LA FUNCIÓN')
% pretty(poly2sym(C));
f=poly2sym(C)
disp('Cálculo de la masa que ingresa o sale del reactor:');
a=input('Tiempo inicial: \n');
b=input('Tiempo final: \n '); 
n;
h=(b-a)/n; x=a; fa=eval(f); x=b; fb=eval(f); fc=0;
for i=1:2:n-1;
x=a+i*h;
fi=eval(f);
fc=fc+fi;
end
fd=0;
for i=2:2:n-2;
x=a+i*h;
fi=eval(f);
fd=fd+fi;
end
I=(h/3)*(fa+4*fc+2*fd+fb);
fprintf('\n %0s %7s %7s %7s %7s \n ','n','a','b','h','I');
fprintf('\n %0.0f %8.4f %8.4f %8.4f %8.4f \n',n,a,b,h,I);
M=Q*I;
fprintf('Masa que ingresa o sale del reactor en mg:\n ');
M 

