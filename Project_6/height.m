clear all;
close all;
clc;
%preprocessing
img=imread('milad.jpg');
img=rgb2gray(imresize(img, [1280, 957]));
th=graythresh(img); 
bw=~im2bw(img,th); 
bw=imfill(bw,'holes');
se=strel('disk',5); 
bw=imopen(bw,se); 
imshow(bw);

% Find the first white pixel from the top row
top_row = 1;
while sum(bw(top_row,:)) == 0
    top_row = top_row + 1;
end

% Find the first white pixel from the bottom row
bottom_row = size(bw,1);
while sum(bw(bottom_row,:)) == 0
    bottom_row = bottom_row - 1;
end

% Calculate the height of the person in pixels
height_pixels = bottom_row - top_row + 1;

% Calculate the height of the person in meters
%pixels_per_meter = 183 / height_pixels; % Assume the person is 183 cm tall
height_meters = height_pixels *0.2072;

% Display the height of the person
fprintf('The height of the person in the image is %.2f centimeters.\n', height_meters);
