clc % Clears the command window.
clear all % Removes all variables from the workspace.
close all % Closes all figures.

I= imread('mgh.jpg'); % Reads the image file 'mgh.jpg' into the variable I.

str = input('enter a text:','s'); % Prompts the user to enter a text string.
disp(size(str)); % Displays the size of the entered string.
r=length(str); % Gets the length of the string.
d=double(str); % Converts the string to its ASCII double representation.

px=20; % Sets the starting x-coordinate for the watermark.
py=20; % Sets the starting y-coordinate for the watermark.
c=0; % Initializes a counter.

% The following loop embeds the watermark into the image.
for i =px:px+r-1
    c=c+1;
    c2=0;
    for j=py:py+7
        c2=c2+1;
        % If the LSB of the pixel is 1 and the corresponding bit in the watermark is 0, decrease the pixel value by 1.
        if bitget(I(i,j),1)==1 && bitget(d(1,c),c2)==0
            I(i,j)=I(i,j)-1;
        % If the LSB of the pixel is 0 and the corresponding bit in the watermark is 1, increase the pixel value by 1.
        elseif  bitget(I(i,j),1)==0 && bitget(d(1,c),c2)==1
           I(i,j)=I(i,j)+1;
        end    
    end
end  

% Stores the starting coordinates and length of the watermark in the first pixel.
I(1,1)=px;
I(1,2)=py;
I(1,3)=r;

imwrite(I,'img3_bit.png'); % Writes the watermarked image to 'img3_bit.png'.
imshow(I) % Displays the watermarked image.
