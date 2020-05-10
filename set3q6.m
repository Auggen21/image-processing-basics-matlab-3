clear all
close all
im=imread('blob_original.tif');
figure,subplot(131),imshow(im)
title('Original Image')
T=60;
first=(im<=T);
second=(im>T);
seg=1*first+255*second;
subplot(132),imshow(uint8(seg))
title(['Thresholded Image, T=',num2str(T)])

%Otsu method
level = graythresh(im);
BW = im2bw(im,level);
subplot(133),imshow(BW)
title('Otsu Method')