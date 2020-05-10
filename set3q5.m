clear all;
close all;
I  = imread('circuit.tif');
figure,imshow(I),title('Original Image')
BW = edge(I,'canny');
[H,theta,rho] = hough(BW);
figure,imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
title('\theta \rho graph')
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P = houghpeaks(H,5);
x = theta(P(:,2)); 
y = rho(P(:,1));
plot(x,y,'s','color','white');
lines = houghlines(BW,theta,rho,P,'FillGap',20,'MinLength',40);
figure, imshow(I), title('Detected Lines'),hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end


