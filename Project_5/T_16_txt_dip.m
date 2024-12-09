% Clear all variables, close all figures, and clear the command window
clear all;
close all;
clc;

% Define the area thresholds for different coins (in pixels)
T1=32279; % 10 Cent
T2=47728;% 25 Cent
T3=55988; % 2 EURO

% Read an image file containing coins into a matrix
img1=imread('c4.jpg');
% Store a copy of the original image
I=img1;
% Compute the optimal threshold for binarizing the image
level = graythresh(img1);
% Convert the image to a binary image using the threshold
img=im2bw(img1,level);
% Fill the holes in the binary image
img = imfill(img,'holes');
% Compute the region properties of the binary image, such as area and centroid
s=regionprops(img,'area');
% Extract the area values of the regions into a vector
area=cat(1,s.Area);
% Extract the centroid coordinates of the regions into a matrix
s1=regionprops(img,'centroid');
center=vertcat(s1.Centroid);
% Find the indices of the regions that have an area larger than 300 pixels
x = find(area>300);
% Get the number of regions that satisfy the condition
l=length(x);
% Initialize the counters for each coin type
c1=0;
c2=0;
c3=0;
% Loop through the regions that have an area larger than 300 pixels
for i=1:length(x)
    % Compute the absolute difference between the area of the region and the thresholds
    v1=abs(area(x(i))-T1);
    v2=abs(area(x(i))-T2);
    v3=abs(area(x(i))-T3);
    % Define the position of the text to be inserted on the image
    position =  [uint16(center(x(i),1))-50  uint16(center(x(i),2))-50];

    % Compare the differences and determine the coin type
    if v1<v2 & v1<v3 
        c1=c1+1;% 10 Cent
        value='10 Cent';
        
    elseif v2<v1  & v2<v3 
        c2=c2+1;% 25 Cent
        value='25 Cent';
        
    else v3<v1 & v3<v2 
        c3=c3+1;% 2 EURO
        value='2 EURO';
    end 
    
    % Insert the text with the coin value on the image
    img1= insertText(img1,position,value,'FontSize',45,'BoxColor','green','TextColor','blue');
end 
% Compute the total amount of money in the image
w=2*c3+0.25*c2+0.10*c1;
% Format the amount to have two decimal places
w=sprintf('%.2f',w);
% Split the amount into two parts: euros and cents
w_parts = strsplit(w,'.');
% Construct a string to display the amount of money
str = strcat('The amount of money in the picture : ',w_parts{1},' EURO and', w_parts{2},' Cents');
% Display the string in the command window
disp(str);
% Create a subplot with 1 row and 2 columns
subplot(121);
% Display the image with the text in the first subplot
imshow(img1);
% Add a title to the first subplot
title('Image with text');
% Display the original image in the second subplot
subplot(122);
imshow(I);
% Add a title to the second subplot
title('Original image');
