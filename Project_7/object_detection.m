close all;
close all;
clc;


for i = 1:7
     str = int2str(i);
     str = strcat(str,'.jpg');
     img=imread(str);
     I=img;
     img=rgb2gray(img);
     level=graythresh(img);
     img=im2bw(img,level-0.065);
     img=bwareaopen(img,700);
     info1 = regionprops(img,'MinorAxisLength','Centroid','MajorAxisLength','Area') ;
     %are=cat(1,info1.Area);
     MajorAxis=cat(1,info1.MajorAxisLength);
     MinorAxis=cat(1,info1.MinorAxisLength);
     %center=vertcat(info1.Centroid);
     d=MinorAxis./MajorAxis;
     A(i)=mean(d);
     %imshow(img);

     
end 
disp(A);

img=imread('T_5.jpg');
I=img;
img=rgb2gray(img);
level=graythresh(img);
img=im2bw(img,level-0.14);
img=bwareaopen(img,700);
info1 = regionprops(img,'MinorAxisLength','Centroid','MajorAxisLength','Area') ;
%are=cat(1,info1.Area);
MajorAxis=cat(1,info1.MajorAxisLength);
MinorAxis=cat(1,info1.MinorAxisLength);
%center=vertcat(info1.Centroid);
d=MinorAxis./MajorAxis;
b=mean(d);
mse=(A-b).^2;
[sortedVals,indexes] = sort(mse);

disp(indexes(1:3));
disp(sortedVals(1:3));
subplot(221);
imshow(I);
title('base image');
for i=1:3
    str = int2str(indexes(i));
    str = strcat(str,'.jpg');
    img=imread(str);
    subplot(2,2,i+1);
    imshow(img);
    title(i);
end
