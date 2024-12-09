clc,
clear,
close all,
I = imread('mgh1.png');
%imshow(I);
x=I(1,1); % retrieving the address of the character  
r=I(1,2); % retrieving the length of the character 
for i=1:r
 str(i)=I(x,i); %retrieving each value in 10th row to rth column
end
str1=char(str);  % converting the values of str to show the string
disp(str1);
