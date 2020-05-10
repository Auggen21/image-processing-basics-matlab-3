clear all
close all
im=imread('lena_RGB.tif');
R=im2double(im(:, :, 1));
G=im2double(im(:, :, 2));
B=im2double(im(:, :, 3));
[M, N]=size(R);

% Hue Calculation
HUE=acosd((0.5*double((R-G)+(R-B)))./(sqrt(double(((R-G).^2)+((R-B).*(G-B))))));
HUE(B>G)=360-HUE(B>G);
    
% Saturation
SAT= (ones(M, N))-((3.*min(R,min(G, B)))./(R+G+B));

% Intensity
INT=(R+B+G)/3;

figure
subplot(221); imshow(im); title('Original image');
subplot(222); imshow(HUE,[]); title('Hue image');
subplot(223); imshow(SAT); title('Saturation image');
subplot(224); imshow(INT); title('Intensity image');

