% ------------------------------------------------------------------------------
% Autores: Sofia Salguero, Jose Matheu y Andy Bonilla
% Programa: proyecto 1, Teoria electromagnética
% Creado: 5 de mayo de 2022
% Descripcion: Algoritmo para evaluar distintos casos de la solución final 
% de la función de potencial dentro de una región rectangular de largo infinito
% -------------------------------------------------------------------------------

% Valores constantes
a = 1;
Vo = 100;
c = (4*Vo)/pi;

% Vectores para coordenadas a evaluar
x = [0.25 0.25 0.25 0.5 0.5 0.5 0.75 0.75 0.75];
y = [0.25 0.5 0.75 0.25 0.5 0.75 0.25 0.5 0.75];
l = length(x);

% Vectores donde se almacenarán los escenarios
v_sal_1 = zeros(1,1);
v_sal_2 = zeros(1,1);
v_sal_3 = zeros(1,1);
v_sal_4 = zeros(1,1);
v_sal_5 = zeros(1,1);

% Variable para almacenar resultados de las evaluaciones
V = 0.0;

% Ciclo for para la variable B (su rango es de 1 a 5, cada uno es un
% escenario distinto) 
for b = 1:5
    
    % Ciclo for para las coordenadas a evaluar
    for m = 1:l
        x_in = x(m);
        y_in = y(m);
        
        % Ciclo for para la sumatoria, con la cantidad de términos que se
        % utilizarán
        for k = 1:5
            n = 2*k-1;
            a1 = sin((n*pi*x_in)/b);
            a2 = sinh((n*pi*y_in)/b);
            a3 = n*sinh((n*pi*a)/b);
            V = V + (c*a1*a2)/a3;
        end
        
        % Switch case para almacenar los resultados en el escenario
        % correcto
        switch b
            case 1 % Primer escenarios
                v_sal_1(m) = V;
                V = 0;
                fprintf(' Escenario 1(%1.0f) =  %11.8f \n',m, v_sal_1(m));
                
            case 2 % Segundo escenario
                v_sal_2(m) = V;
                V = 0;
                fprintf(' Escenario 2(%1.0f) =  %11.8f \n',m, v_sal_2(m));
                
            case 3 % Tercer escenario
                v_sal_3(m) = V;
                V = 0;
                fprintf(' Escenario 3(%1.0f) =  %11.8f \n',m, v_sal_3(m));
                
            case 4 % Cuarto escenario
                v_sal_4(m) = V;
                V = 0;
                fprintf(' Escenario 4(%1.0f) =  %11.8f \n',m, v_sal_4(m));
                
            case 5 % Quinto escenario
                v_sal_5(m) = V;
                V = 0;
                fprintf(' Escenario 5(%1.0f) =  %11.8f \n',m, v_sal_5(m)); 
        end
    end
end

%% Gráficas

% Escenario 1
figure(1);
subplot( 1 , 2 , 1 ) ; 
plot3(x,y,v_sal_1,'o','Color','r');
labels_1 = string(round(v_sal_1,2));
ax = gca;
ax.XLim = [0 1];
ax.YLim = [0 1];
text(x,y,labels_1,'VerticalAlignment','cap','HorizontalAlignment','center');
grid on
view(0,90)

subplot(1,2,2) ;
X = reshape(x,3,3);
Y = reshape(y,3,3);
V1 = reshape(v_sal_1,3,3);
contour(X,Y,V1);
text(x,y,labels_1,'VerticalAlignment','bottom','HorizontalAlignment','center');
ax = gca;
ax.XLim = [0.1 0.9];
ax.YLim = [0.2 0.8];
grid on

sgtitle("Escenario # 1");

% Escenario 2
figure(2);
subplot( 1 , 2 , 1 ) ; 
plot3(x,y,v_sal_2,'o','Color','#77AC30');
labels_2 = string(round(v_sal_2,2));
ax = gca;
ax.XLim = [0 1];
ax.YLim = [0 1];
text(x,y,labels_2,'VerticalAlignment','cap','HorizontalAlignment','center');
grid on
view(0,90) 

subplot(1,2,2) ;
X = reshape(x,3,3);
Y = reshape(y,3,3);
V2 = reshape(v_sal_2,3,3);
contour(X,Y,V2);
text(x,y,labels_2,'VerticalAlignment','bottom','HorizontalAlignment','center');
ax = gca;
ax.XLim = [0.1 0.9];
ax.YLim = [0.2 0.8];
grid on
sgtitle("Escenario # 2");

% Escenario 3
figure(3);
subplot( 1 , 2 , 1 ) ; 
plot3(x,y,v_sal_3,'o','Color','b');
labels_3 = string(round(v_sal_3,2));
ax = gca;
ax.XLim = [0 1];
ax.YLim = [0 1];
text(x,y,labels_3,'VerticalAlignment','cap','HorizontalAlignment','center');
title("Escenario # 3");
grid on
view(0,90) 

subplot(1,2,2) ;
X = reshape(x,3,3);
Y = reshape(y,3,3);
V3 = reshape(v_sal_3,3,3);
contour(X,Y,V3);
text(x,y,labels_3,'VerticalAlignment','bottom','HorizontalAlignment','center');
ax = gca;
ax.XLim = [0.1 0.9];
ax.YLim = [0.2 0.8];
grid on
sgtitle("Escenario # 3");

% Escenario 4
figure(4);
subplot( 1 , 2 , 1 ) ; 
plot3(x,y,v_sal_4,'o','Color','m');
labels_4 = string(round(v_sal_4,2));
ax = gca;
ax.XLim = [0 1];
ax.YLim = [0 1];
text(x,y,labels_4,'VerticalAlignment','cap','HorizontalAlignment','center');
grid on
view(0,90)

subplot(1,2,2) ;
X = reshape(x,3,3);
Y = reshape(y,3,3);
V4 = reshape(v_sal_4,3,3);
contour(X,Y,V4);
text(x,y,labels_4,'VerticalAlignment','bottom','HorizontalAlignment','center');
ax = gca;
ax.XLim = [0.1 0.9];
ax.YLim = [0.2 0.8];
grid on
sgtitle("Escenario # 4");

% Escenario 5
figure(5);
subplot( 1 , 2 , 1 ) ; 
plot3(x,y,v_sal_5,'o','Color','#EDB120');
labels_5 = string(round(v_sal_5,2));
ax = gca;
ax.XLim = [0 1];
ax.YLim = [0 1];
text(x,y,labels_5,'VerticalAlignment','cap','HorizontalAlignment','center');
grid on
view(0,90)

subplot(1,2,2) ;
X = reshape(x,3,3);
Y = reshape(y,3,3);
V5 = reshape(v_sal_5,3,3);
contour(X,Y,V5);
text(x,y,labels_5,'VerticalAlignment','bottom','HorizontalAlignment','center');
ax = gca;
ax.XLim = [0.1 0.9];
ax.YLim = [0.2 0.8];
grid on
sgtitle("Escenario # 5");

% %This program c a l c u l a t e s the s o l u t i o n t o Laplace ' s e qu a ti on , which i s
% %d e fi n e d a s the di v e r g e n c e o f the g r a di e n t o f a c e r t i a n p o t e n t i a l ( o r
% %s t e a d y s t a t e he a t fl ow ) . The program c a l c u l a t e s the s o l u t i o n s t o Laplace ' s
% %e q u a ti o n u si n g the r e l a x a t i o n method , and d oe s s o f o r a s q u a r e g ri d t h a t
% %has a 100 u ni t p r i n c i p a l l e n g t h .
% x = 0 : 1 : 75 ; %d e f i n e s the p h y s i c a l sp ace f o r the model
% y = 0 : 1 : 75 ; %( c r e a t e s the g ri d t o pl o t s o l u t i o n v al u e s on )
% V ( 76 , 76 ) = 0 ; % Se t a l l p oi n t s t o z e r o .
% for i=1:76
% V ( i , 1 ) = 0; % Se t one boundary t o a c e r t a i n f u n c ti o n ( i n V ol t s ) .
% end
% for i=1:76
% V ( 1 , i ) = 0 ; % Se t one boundary t o a c e r t a i n f u n c ti o n ( i n V ol t s ) .
% end
% for i=1:76
% V ( i , 76 ) = 0 ; % Se t one boundary t o a c e r t a i n f u n c ti o n ( i n V ol t s ) .
% end
% for i=1:76
% V ( 76 , i ) = 100 ; % Se t one boundary t o t o a c e r t a i n f u n c ti o n ( i n V ol t s ) .
% end
% n=1000; %s e t s the number o f i t e r a t i o n s , need s t o be q ui t e hi gh t o g e t a
% %good r e p r e s e n t a t i o n o f the s o l u t i o n
% for i=1:n ; %f o r l o o p u si n g the r e l a x a t i o n method t o c a l c u l a t e the p o t e n t i a l
% for ix = 2 : 75 ; % a l l i n t e r n a l p oi n t s
% for iy = 2 : 75 ; % (N − 2 t o t a l i n t e r n a l p oi n t s f o r each dimen si on )
% V( iy , ix ) = ( V ( iy-1,ix ) + V ( iy+1,ix ) + V ( iy , ix -1) + V ( iy , ix+1) ) / 4;
% end
% end
% end
% V ; % P ri n t out v al u e s f o r the e l e c t r i c p o t e n t i a l (uncomment i f you r e a l l y
% % want t o s e e t hi s , but i t ' s 1000 numbers )
% [ X , Y ] = meshgrid ( x , y ) ; % p l o t s a mesh o f the s o l u t i o n
% subplot( 2 , 2 , 1 ) ; surf ( X , Y , V ) %p l o t s a s u r f a c e pl o t o f the s o l u t i o n
% xlabel( ' x ' ) ; ylabel( ' y ' ) ; zlabel ( ' Potential in Volts ' ) ;
% subplot( 2 , 2 , 2 ) ; contour ( X , Y , V )%shows a ( shaded ) c on t ou r pl o t o f the s o l u t i o n
% [ potential ] = contour( V ) ;
% xlabel ( ' x ' ) ;ylabel ( ' y ' ) ; clabel( potential ) ;
% subplot( 2 , 2 , 3 ) ; contour3 ( X , Y , V ) %shows a c on t ou r pl o t with c ol o r e d l i n e s
% xlabel( ' x ' ) ; ylabel( ' y ' ) ; zlabel( ' Potential in Volts ' ) ;
% subplot( 2 , 2 , 4 ) ; meshc ( X , Y , V ) %shows a mesh pl o t o f the s o l u t i o n
% xlabel( ' x ' ) ; ylabel( ' y ' ) ; zlabel ( ' Potential in Volts ' ) ;
