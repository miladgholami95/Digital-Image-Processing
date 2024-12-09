clear all;
clc;
close all;
txt = {'sticky-note', 'eraser','Toothbrush','comb'};
for i =1: 4
     str = int2str(i);
     str = strcat(str,'.jpg');
     img=imread(str);
     I=img;
     img=rgb2gray(img);
     level=graythresh(img);
     img=im2bw(img,level-0.20);
     img=bwareaopen(img,700);
     info1 = regionprops(img,'MinorAxisLength','Centroid','MajorAxisLength','Area') ;
     MajorAxis=cat(1,info1.MajorAxisLength);
     MinorAxis=cat(1,info1.MinorAxisLength);
     center=vertcat(info1.Centroid);
     d(i)=MinorAxis/MajorAxis;
     %c(i)=center(1);
     %disp(center);
    %imshow(img);    
end
[FileName,PathName]=uigetfile ({'*.gif;*.png;*.jpg', 'Supported Picture Formats'});
str=strcat(PathName,FileName);
%img=imread('T_15.jpg');
img=imread(str);
I=img;
imshow(I);
img=rgb2gray(img);
level=graythresh(img);
img=im2bw(img,level-0.20);
img=bwareaopen(img,700);
info1 = regionprops(img,'MinorAxisLength','Centroid','MajorAxisLength','Area') ;
MajorAxis=cat(1,info1.MajorAxisLength);
MinorAxis=cat(1,info1.MinorAxisLength);
center=vertcat(info1.Centroid);
b=[];
b=MinorAxis./MajorAxis;
k=zeros([1,8]);
for i=1:length(b)
   mse=(d-b(i)).^2;
   ind=find(mse==min(mse));
   position =  [uint16(center(i,1))-80  uint16(center(i,2))];
   I= insertText(I,position,txt{ind},'FontSize',30);
   k(ind)=1+k(ind);
   disp(i); 
end
str='this image consist of background black and  : ';
for i=1:length(k)
    if k(i)~=0
        n = int2str(k(i));
        %str = [str newline];
        str = strcat(str,{' '},'( ',n,' )',{''},txt{i}); 
    end 
end 
figure;
imshow(I);
disp(str);
h = msgbox(str);

