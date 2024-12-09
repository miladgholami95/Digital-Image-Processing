% Prepare the environment for the watermarking process
clc; % Clear the command window to remove any previous outputs
clear all; % Clear all the workspace variables to free up memory
close all; % Close all the graphics windows to avoid cluttering the screen

% Read an audio file that will be embedded into an image
[x,fs] = audioread('Dark_Souls.wav'); % Use the audioread function to read the audio file and store the audio data in x and the sampling frequency in fs
x=rescale(x,0,1); % Rescale the audio data to the range [0,1] to match the pixel values of the image

% Read an image file that will be used as the cover media
img=imread('missing_data.png'); % Use the imread function to read the image file and store the image data in img
img=rgb2gray(img); % Use the rgb2gray function to convert the image to grayscale, since we only need one channel to store the audio data

% Get the size of the image and reshape it into a column vector
[i,j]=size(img); % Use the size function to get the number of rows (i) and columns (j) of the image
img=img(:); % Reshape the image into a column vector by using the colon operator, so that we can access the pixels sequentially

% Encode the sampling frequency (fs) in the first 10 pixels of the image
fs=num2str(fs); % Convert the sampling frequency to a string by using the num2str function, so that we can store it as ASCII codes
r1=length(fs); % Get the length of the string by using the length function, so that we know how many pixels we need to store it
d1=double(fs); % Convert the string to a vector of ASCII codes by using the double function, so that we can store them as pixel values
img(1)=r1; % Store the length of the string in the first pixel of the image, so that we can retrieve it later
for k=3:r1+2 % Loop from the third pixel to the (r1+2)th pixel
  img(k)=d1(1,k-2); % Store the ASCII codes of the string in the image pixels, leaving the second pixel empty for now 
end

% Encode the length of the audio data (length(x)) in the next 10 pixels of the image
l_audio=num2str(length(x)); % Convert the length of the audio data to a string by using the num2str function, so that we can store it as ASCII codes
r2=length(l_audio); % Get the length of the string by using the length function, so that we know how many pixels we need to store it
d2=double(l_audio); % Convert the string to a vector of ASCII codes by using the double function, so that we can store them as pixel values
img(11)=r2; % Store the length of the string in the 11th pixel of the image, so that we can retrieve it later
disp(r2) % Display the length of the string on the command window by using the disp function, for debugging purposes
for k=13:r2+12 % Loop from the 13th pixel to the (r2+12)th pixel
  img(k)=d2(1,k-12); % Store the ASCII codes of the string in the image pixels  
end

% Reshape the image back to its original size and display it
img=reshape(img,i,j); % Reshape the image back to its original size by using the reshape function, so that we can see the image
figure; % Create a new graphics window by using the figure function, to display the image
imshow(img); % Display the image by using the imshow function, to see how the image looks after encoding the audio information

% Convert the image to double precision and store the audio data in the image pixels
img=im2double(img); % Convert the image to double precision by using the im2double function, to increase the accuracy of the pixel values
A=img(:); % Reshape the image into a column vector by using the colon operator, so that we can access the pixels sequentially
n=0; % Initialize a counter variable, to keep track of the audio data index
for k=1: length(x) % Loop from the first pixel to the last pixel of the audio data
    n=n+1; % Increment the counter variable, to move to the next audio data sample
    A(n*10)= x(k); % Store the audio data in every 10th pixel of the image, leaving the other pixels unchanged 
end 
A(2)=length(x)/100000; % Store the length of the audio data divided by 100000 in the second pixel of the image, to avoid overflow
img=reshape(A,i,j); % Reshape the image back to its original size by using the reshape function, to get the watermarked image
figure; % Create a new graphics window by using the figure function, to display the watermarked image
imshow(img); % Display the watermarked image by using the imshow function, to see how the image looks after embedding the audio data
imwrite(img,'wm_image.png'); % Write the watermarked image to a file by using the imwrite function, to save the watermarked image
