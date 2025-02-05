%Name:    Isaac Nakone
%Date:    03/02/2025
%Purpose: To show the division of a cell using 
%         implicit curves.

clear; clc; close all;

[x,y,z] = meshgrid(-10:0.1:10,-5:0.1:5,-5:0.1:5);

a = linspace(0,5,4);

R = 3;


f1 = @(x,y,z,a) R^2 - ( (x+a).^2+y.^2+z.^2 ); 
f2 = @(x,y,z,a) R^2 - ( (x-a).^2+y.^2+z.^2 ); 

k = 0.1;

V1 = log(exp(k*f1(x,y,z,a(1)))+exp(k*f2(x,y,z,a(1))))/k;
V2 = log(exp(k*f1(x,y,z,a(2)))+exp(k*f2(x,y,z,a(2))))/k;
V3 = log(exp(k*f1(x,y,z,a(3)))+exp(k*f2(x,y,z,a(3))))/k;
V4 = log(exp(k*f1(x,y,z,a(4)))+exp(k*f2(x,y,z,a(4))))/k;

[faces1, verts1] = isosurface(x,y,z,V1,0.01);
[faces2, verts2] = isosurface(x,y,z,V2,0.01);
[faces3, verts3] = isosurface(x,y,z,V3,0.01);
[faces4, verts4] = isosurface(x,y,z,V4,0.01);


figNum = 1;
figure(figNum)
subplot(2,2,1);
patch('faces',faces1,'Vertices',verts1,'FaceColor','yellow','EdgeAlpha',0);
lightangle(-45,30)
lighting gouraud
xlim([-10,10]);
ylim([-5,5]);
zlim([-5,5]);
title("Stage $1$ - parent cell triggers mitosis","Interpreter","latex");
xlabel("$x$","Interpreter","latex");
ylabel("$y$","Interpreter","latex");
zlabel("$z$","Interpreter","latex");
set(gca, 'color', 'k');

subplot(2,2,2)

patch('faces',faces2,'Vertices',verts2,'FaceColor','yellow','EdgeAlpha',0);
lightangle(-45,30)
lighting gouraud
xlim([-10,10]);
ylim([-5,5]);
zlim([-5,5]);
title("Stage $2$","Interpreter","latex");
xlabel("$x$","Interpreter","latex");
ylabel("$y$","Interpreter","latex");
zlabel("$z$","Interpreter","latex");
set(gca, 'color', 'k');


subplot(2,2,3);
patch('faces',faces3,'Vertices',verts3,'FaceColor','yellow','EdgeAlpha',0);
lightangle(-45,30)
lighting gouraud
xlim([-10,10]);
ylim([-5,5]);
zlim([-5,5]);
title("Stage $3$","Interpreter","latex");
xlabel("$x$","Interpreter","latex");
ylabel("$y$","Interpreter","latex");
zlabel("$z$","Interpreter","latex");
set(gca, 'color', 'k');

subplot(2,2,4)

patch('faces',faces4,'Vertices',verts4,'FaceColor','yellow','EdgeAlpha',0);
lightangle(-45,30)
lighting gouraud
xlim([-10,10]);
ylim([-5,5]);
zlim([-5,5]);
title("Stage $4$ - Two daughter cells","Interpreter","latex");
xlabel("$x$","Interpreter","latex");
ylabel("$y$","Interpreter","latex");
zlabel("$z$","Interpreter","latex");
set(gca, 'color', 'k');
set(1, 'units', 'centimeters', 'pos', [0 0 15 10])

pos = get(figNum,'Position');
set(figNum,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
print(figNum,'CellDivisionDemo','-dpdf','-r0')