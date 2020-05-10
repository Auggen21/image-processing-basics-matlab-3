clc; clear all; close all;
orgImg = im2double(imread('cameraman.tif'));
[r,c] = size(orgImg);
h = fspecial('motion',20,45);
g = imfilter(orgImg,h,'circular');
n = imnoise(zeros(r,c),'gaussian');
size(n);
size(g);
g = g + n;
    
subplot(131); imshow(g); title('Degraded Image:');
% Sn(u,v) = |N(u,v)|^2 = Power Spectrum of Noise
Sn = abs(fft2(n)).^2;
% Sf(u,v) = |F(u,v)|^2 = Power Spectrum of Image
Sf = abs(fft2(orgImg)).^2;
% Average Noise Power = Sum(Sn)/(r*c);
nA = sum(Sn(:))/numel(Sn);
% Average Image Power = Sum(Sn)/(r*c);
fA = sum(Sf(:))/numel(Sf);
R = nA/fA;
fcap=deconvwnr(g, h, R);
subplot(132); imshow(fcap); title('Constant Ratio');
%Noise correlation
NCORR = fftshift(real(ifft2(Sn)));
%Image correlation
ICORR = fftshift(real(ifft2(Sf)));
Auto=autocorr(g(:));
fcap2 =deconvwnr(g, h, NCORR,ICORR);
subplot(133); imshow(fcap2); title('Autocorrelation');
