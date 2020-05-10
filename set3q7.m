clear all
close all
orgImg=imread('figBlob.tif');
f=imadjust(orgImg, [0 1], [1 0]);
se=strel('disk',20,8);
S=imerode(f, se);
T=input('Enter the Threshold: ');
if numel(S) == 1
   SI = f == S;
   S1 = S;
else
% S is an array. Eliminate duplicate, connected seed locations 
% to reduce the number of loop executions in the following 
% sections of code.
   SI = bwmorph(S, 'shrink', Inf);  
   S1 = f(SI(:)); % Array of seed values.
end
TI = false(size(f));    
for K = 1:length(S1)
   seedvalue = S1(K);
   S2 = abs(f - seedvalue) <= T;%predicate
   TI = TI | S2;
end
% Use function imreconstruct with SI as the marker image to 
% obtain the regions corresponding to each seed in S. Function
% bwlabel assigns a different integer to each connected region.
[g, NR] = bwlabel(imreconstruct(SI, TI));
subplot(121);imshow(orgImg);title('Original Image');
subplot(122);imshow(1-g);title('Segmentation based on Region growing');
