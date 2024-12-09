% Prepare the environment for the watermark extraction process
clc; % Clear the command window to remove any previous outputs
clear all; % Clear all the workspace variables to free up memory
close all; % Close all the graphics windows to avoid cluttering the screen

% Read an image file that contains a hidden audio file
img=imread('wm_image.png'); % Use the imread function to read the image file and store the image data in img
A=img(:); % Reshape the image into a column vector by using the colon operator, so that we can access the pixels sequentially

% Decode the sampling frequency (fs) from the first 10 pixels of the image
r1=A(1); % Retrieve the length of the string that represents the sampling frequency from the first pixel of the image, which was stored during the watermarking process
for i=3:r1+2 % Loop from the third pixel to the (r1+2)th pixel
 str(i-2)=A(i); % Retrieve the ASCII codes of the string from the image pixels, which were stored during the watermarking process
end
fs=str2num(char(str)); % Convert the vector of ASCII codes to a string and then to a number by using the char and str2num functions, to get the sampling frequency of the audio file

% Decode the length of the audio data (length(x)) from the next 10 pixels of the image
r2=A(11); % Retrieve the length of the string that represents the length of the audio data from the 11th pixel of the image, which was stored during the watermarking process
disp(r2) % Display the length of the string on the command window by using the disp function, for debugging purposes
for i=13:r2+12 % Loop from the 13th pixel to the (r2+12)th pixel
 str(i-12)=A(i); % Retrieve the ASCII codes of the string from the image pixels, which were stored during the watermarking process
end
l_audio=str2num(char(str)); % Convert the vector of ASCII codes to a string and then to a number by using the char and str2num functions, to get the length of the audio data
disp(l_audio); % Display the length of the audio data on the command window by using the disp function, for debugging purposes

% Extract the audio data from the image pixels
k=l_audio; % Assign the length of the audio data to a variable k, to use it as a loop limit
audio=zeros(1,k); % Create a vector of zeros with size 1 by k by using the zeros function, to store the extracted audio data
n=0; % Initialize a counter variable, to keep track of the image pixel index
for i=1:k % Loop from the first pixel to the last pixel of the audio data
    n=n+1; % Increment the counter variable, to move to the next image pixel
    audio(i)=A(n*10); % Extract the audio data from every 10th pixel of the image, which were stored during the watermarking process 
end   
audio=rescale(audio , -1 ,1); % Rescale the audio data to the range [-1,1] by using the rescale function, to match the original audio range
plot(audio); % Plot the audio data by using the plot function, to see the waveform of the audio file
audiowrite('decoded_audio.wav', audio, fs); % Write the audio data to a file by using the audiowrite function, to save the extracted audio file
