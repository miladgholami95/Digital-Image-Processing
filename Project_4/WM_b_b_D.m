% This code extracts a hidden message from an image using LSB watermarking
clc % Clear the command window
clear all % Clear all variables
close all % Close all figures
I=imread('img3_bit.png'); % Read the watermarked image
px=I(1,1); % Get the x-coordinate of the top-left corner of the message
py=I(1,2); % Get the y-coordinate of the top-left corner of the message
r=I(1,3); % Get the length of the message in pixels

c=0; % Initialize a counter for the message characters
for i =px:px+r-1 % Loop over the rows of the message
    c=c+1; % Increment the counter
   d0=bitget(I(i,py:py+7),1); % Get the LSB of the 8 pixels in the current row
   d1=fliplr(d0); % Flip the bits to get the correct order
   d2=num2str(d1); % Convert the bits to a string
   d3=bin2dec(d2); % Convert the string to a decimal number
   ch1(c)=char(d3); % Convert the decimal number to a character and store it in the message array
end 
disp(ch1); % Display the message
