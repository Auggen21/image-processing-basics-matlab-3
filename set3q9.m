clear all;
close all
orgImg=imread('figBlob.tif');
orgImg=im2double(orgImg);
figure,subplot(221);imshow(orgImg);title('Original Image');
%binary map of image by thresholding with otsu's method
bw=~imbinarize(orgImg, graythresh(orgImg));
%distance transform of image
D=bwdist(bw);
subplot(222);imshow(D);title('Distance Transform');
%watershed
%gradient image
h= fspecial('prewitt');
gx=imfilter(orgImg, h, 'replicate');
gy= imfilter(orgImg, h', 'replicate');
gm=sqrt(gx.^2+gy.^2);
%smoothening
g=imfilter(gm, fspecial('disk',4));
%binary image & distance transform
bw1=imbinarize(g, graythresh(g));
D1=bwdist(~bw1);
L = watershed(D1);
%watershed crest lines
w = (L==0);
%watershed boundary overlappped to original
wsSeg=orgImg;
wsSeg(w)=1;
subplot(223);imshow(w);title('Watershed Crest Lines');
subplot(224);imshow(wsSeg,[]);title('Watershed Transform');