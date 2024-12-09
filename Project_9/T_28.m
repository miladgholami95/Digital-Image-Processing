clear all; 
close all; 
clc; 
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'},'Select MRI'); % Open a file dialog for the user to select an MRI image file.
addr = strcat(pathname, filename); % Concatenate the path and the file name to form the full path to the image file.
w=imread(addr); % Read the image file into an array.

w1=yuv_rgb(w); % Convert the image from the YUV color space to the RGB color space.
w2=hsv_convert(w); % Convert the image from the HSV color space to the RGB color space.
w3=rgbcovert(w); % Convert the image from the RGB color space to the RGB color space.

answer = questdlg('Would you like calculate accuracy?','calculate accuracy','Ok','No','No'); % Display a dialog box asking the user if they would like to calculate the accuracy.
switch answer % Depending on the user's answer...
    case 'Ok' % If the user clicked 'Ok'...
        [filename, pathname] = uigetfile({'*.png';'*.jpg';'*.bmp'},'Select MRI'); % Open a file dialog for the user to select an MRI image file.
        addr = strcat(pathname, filename); % Concatenate the path and the file name to form the full path to the image file.
        w5=imread(addr); % Read the image file into an array.
        w5=im2bw(w5); % Convert the image to binary.
        figure; % Create a new figure window.
        subplot(2,4,1); % Create the first subplot in a 2x4 grid of subplots.
        imshow(w); % Display the original image.
        title('orginal image'); % Add a title to the subplot.
        subplot(2,4,2); % Create the second subplot in a 2x4 grid of subplots.
        imshow(w1); % Display the image converted from the YUV color space.
        title('rgb'); % Add a title to the subplot.
        subplot(2,4,3); % Create the third subplot in a 2x4 grid of subplots.
        imshow(w2); % Display the image converted from the HSV color space.
        title('hsv'); % Add a title to the subplot.
        subplot(2,4,4); % Create the fourth subplot in a 2x4 grid of subplots.
        imshow(w3); % Display the image converted from the RGB color space.
        title('yuv&rgb'); % Add a title to the subplot.
        subplot(2,4,5); % Create the fifth subplot in a 2x4 grid of subplots.
        imshow(w5); % Display the binary image.
        title('ground image'); % Add a title to the subplot.
        subplot(2,4,6); % Create the sixth subplot in a 2x4 grid of subplots.
        C = confusionmat(logical(w1(:)),(w5(:))); % Compute the confusion matrix between the binary image and the image converted from the YUV color space.
        a=confusionchart(C); % Display the confusion matrix as a chart.
        title('accuracy rgb'); % Add a title to the subplot.
        subplot(2,4,7); % Create the seventh subplot in a 2x4 grid of subplots.
        C = confusionmat(logical(w2(:)),(w5(:))); % Compute the confusion matrix between the binary image and the image converted from the HSV color space.
        a=confusionchart(C); % Display the confusion matrix as a chart.
        title('accuracy hsv'); % Add a title to the subplot.
        subplot(2,4,8); % Create the eighth subplot in a 2x4 grid of subplots.
        C = confusionmat(logical(w3(:)),(w5(:))); % Compute the confusion matrix between the binary image and the image converted from the RGB color space.
        a=confusionchart(C); % Display the confusion matrix as a chart.
        title('accuracy yuv'); % Add a title to the subplot.
    case 'No' % If the user clicked 'No'...
        figure; % Create a new figure window.
        subplot(2,2,1); % Create the first subplot in a 2x2 grid of subplots.
        imshow(w); % Display the original image.
        title('orginal image'); % Add a title to the subplot.
        subplot(2,2,2); % Create the second subplot in a 2x2 grid of subplots.
        imshow(w1); % Display the image converted from the YUV color space.
        title('rgb'); % Add a title to the subplot.
        subplot(2,2,3); % Create the third subplot in a 2x2 grid of subplots.
        imshow(w2); % Display the image converted from the HSV color space.
        title('hsv'); % Add a title to the subplot.
        subplot(2,2,4); % Create the fourth subplot in a 2x2 grid of subplots.
        imshow(w3); % Display the image converted from the RGB color space.
        title('yuv&rgb'); % Add a title to the subplot.
end
