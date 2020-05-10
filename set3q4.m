clear all
close all
im=imread('lena_RGB.tif');
[h,s,i]=rgb2hsv(im);
ih=histeq(i);
new(:,:,1)=h;
new(:,:,2)=s;
new(:,:,3)=ih;
newim=hsv2rgb(new);
subplot(2,2,1),imshow(im);title('RGB Image');
subplot(2,2,2),imshow(i);title('Original Intensity ');
subplot(2,2,3),imshow(ih);title('Histogram Equalized Intensity');
subplot(2,2,4),imshow(newim);title('New RGB image');