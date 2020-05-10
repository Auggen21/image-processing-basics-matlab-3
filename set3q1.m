clear all;
close all;
img=imread('aerial_view_no_turb.tif');
[M,N]=size(img);
FM=fftshift(fft2(img));
k=0.0025; %turbulance
for i=1:M
    for j=1:N
        H(i,j)=exp(-k*((i-M/2)^2+(j-N/2)^2));
    end
end
GM=FM.*H;
noimg=ifft2(GM);
figure,subplot(1,2,1),imshow(abs(noimg),[]);title(['Image With Turbulance,k=',num2str(k)])

%Inverse Filtering
OUT=GM./H;
inv=ifft2(OUT);
subplot(1,2,2),imshow(abs(inv),[]),title('Inverse Filtering ');