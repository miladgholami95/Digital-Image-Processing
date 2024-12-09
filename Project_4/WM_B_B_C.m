%coding watermarking byte
clc
clear all
close all
j=imread('mgh.jpg');
% imshow(I);
I=rgb2gray(j);
str = input('enter a text:','s');
r=length(str);
d=double(str); % This converts the text message from characters to numbers and stores it in a variable d
for i=1:r
  I(10,i)=d(1,i); % This assigns the i-th element of d to the pixel value at row 10 and column i of I
  
end
x=10;
I(1,1)=x; % saving the string address 
I(1,2)=r; % saving the string lenght 

imshow(I);
imwrite(I,'mgh1.png');






