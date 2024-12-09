clear all;
close all;
clc;

img1=imread('coin1.jpg');
img2=imread('coin2.jpg');
img3=imread('coin3.jpg');
subplot(121);
imshow(img3);
level = graythresh(img3);
img=im2bw(img3,level);
img = imfill(img,'holes');
s=regionprops(img,'area');
area=cat(1,s.Area);
subplot(122);
imshow(img);

x = find(area>200);
disp(area(x));
%Ti=x;
T1=32279; % 10 Cent
T2=47728;% 25 Cent
T3=55988; % 2 EURO 

