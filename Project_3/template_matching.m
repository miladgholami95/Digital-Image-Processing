% Clear all variables, close all figures, and clear the command window
clear all;
close all;
clc;

% Load the template labels from a mat file and store them in a variable
v1=load('template_label.mat');
label_train=v1.d;

% Load the query labels from a mat file and store them in a variable
v2=load('query_label.mat');
label_test=v2.d;

% Prompt the user to select an image file with gif, png, or jpg extension
[FileName,PathName]=uigetfile ({'*.gif;*.png;*.jpg', 'Supported Picture Formats'});
% Concatenate the file name and path name to get the full address of the file
str=strcat(PathName,FileName);
% Read the image file into a matrix
I=imread(str);
% Display the image in a figure window
imshow(I);
% Add a title to the figure
title('query image');

% Convert the image to grayscale
I=rgb2gray(I);
% Resize the image to 150 by 150 pixels
I=imresize(I,[150,150]);

% Initialize a vector to store the correlation coefficients
c = zeros(1,50);

% Loop through 50 template images
for i=1:50
    % Convert the index to a string
    str = int2str(i);
    % Construct the file name of the template image
    str = strcat('.\template\a',str,'.png');
    % Read the template image into a matrix
    img=imread(str);
    % Compute the correlation coefficient between the query image and the template image
    c(i)=corr2(I,img);
    % Display the index
    %disp(i);    
end

% Find the maximum correlation coefficient and its index
[argvalue,ind] = max(c);
% Convert the index to a string
str = int2str(ind);
% Construct the file name of the matched image
str = strcat('.\template\a',str,'.png');
% Display the file name
disp(str);
% Read the matched image into a matrix
img=imread(str);
% Create a new figure window
figure;
% Display the matched image in the figure window
imshow(img);
% Add a title to the figure
title('matched image');
% Display the index of the matched image
disp(ind);
