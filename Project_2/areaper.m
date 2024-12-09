clear all;
close all;
clc;
x=zeros(100,100);
for i=26:1:75
for j=26:1:75
x(i,j)=1;
end
end
imshow(x);
d=zeros(100,100);
b=zeros(100,100);
% finding vertical edges
for i=1:1:99
for j=1:1:99
if x(i,j) ~= x(i,j+1) && x(i,j)==1
d(i,j)=1;
elseif x(i,j) ~= x(i,j+1) && x(i,j+1)==1
d(i,j+1)=1;
end
end
end
%finding horizontal edges
for j=1:1:99
for i=1:1:99
if x(i,j) ~= x(i+1,j) && x(i,j)==1
d(i,j)=1;
elseif x(i,j) ~= x(i+1,j) && x(i+1,j)==1
d(i+1,j)=1;
end
end
end

figure;
imshow(d);
c=0;
%calculating the perimeter of the figure from edges
for j=1:1:100
for i=1:1:100
if d(i,j) ==1
c=c+1;
end
end
end
disp('prim = ');
disp(c);
% calculating the area of the figure
c=0;
for j=1:1:100
for i=1:1:100
if x(j,i) ==1
c=c+1;
end
end
end
disp('area = ');
disp(c);