clear all;
close all;
clc

T1=32279; % 10 cent
T2=47728;% 25 cent
T3=55988; % 2 euro 

img1=imread('c3.jpg');
subplot(121);
imshow(img1);
level = graythresh(img1);
img=im2bw(img1,level);
img = imfill(img,'holes');
s=regionprops(img,'area');
area=cat(1,s.Area);
subplot(122);
imshow(img);
x = find(area>300);
disp(area(x));
l=length(x);
c1=0;
c2=0;
c3=0;
for i=1:length(x)
    v1=abs(area(x(i))-T1);
    v2=abs(area(x(i))-T2);
    v3=abs(area(x(i))-T3);
   
    if v1<v2 & v1<v3 
        c1=c1+1;% 10 cent
    elseif v2<v1  & v2<v3 
        c2=c2+1;% 25 cent
    elseif v3<v1 & v3<v2 
        c3=c3+1;% 2 euro
    end 
end  
w=2*c3+0.25*c2+0.10*c1;
w=sprintf('%.2f',w);
w_parts = strsplit(w,'.');
str = strcat('The amount of money in the picture : ',w_parts{1},' EURO and ', w_parts{2},' Cent');
disp(str);
f = msgbox(str);

