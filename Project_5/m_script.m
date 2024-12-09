clear all;
clc;
close all;
x=imread('c3.jpg');
level = graythresh(x);
img=im2bw(x,level);
img2=bwareaopen(img,50);

subplot(1,3,1);
imshow(x);
title('base image');
subplot(1,3,2);
imshow(img);
title('binary image');
subplot(1,3,3);
imshow(img2);
title('bwareaopen 50');
figure;
imshowpair(img,img2,'montage');
