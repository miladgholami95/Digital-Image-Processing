clear;
clc;
close all;
%pre-processing
I = imread ('kaf.png');
bwImage = ~(im2bw(I)); %converts the image to a binary image (black and white) using a threshold value, and then inverts it using the ~ operator. This means that the background will be black and the foreground will be white.
rp = regionprops(bwImage,'BoundingBox'); %calculates the bounding box of the foreground region using the regionprops function. The bounding box is a rectangle that encloses the region of interest.
subImage = imcrop(bwImage,rp.BoundingBox); %crops the image using the bounding box coordinates and stores it in a variable called subImage.
binImage = ~subImage; % inverts the cropped image again, so that the background is white and the foreground is black.
Image = imresize(binImage,[100 100]); % resizes the image to 100 by 100 pixels using the imresize function. This is done to make the image size consistent for feature extraction.
A = ~Image; %inverts the image once more, so that the background is black and the foreground is white. This is done to make the feature extraction easier.
%predefine feature_vectors 
feature_vector_two = [2 2 2];
feature_vector_four = [2 2 3];
feature_vector_kaf = [2 3 4];
feature_vector_sin = [5 4 2];
feature_vector_mim = [4 2 4];
feature_vector_sad = [5 3 4];
feature_vector_ta = [2 5 4];

% Draw horizontal and vertical lines
line1 = A(25,:); % extracts a horizontal line from row 25 of matrix A, which represents the image. The colon means all columns from that row.
line2 = A(75,:); %  extracts a horizontal line from row 75 of matrix A, which represents another horizontal line at 75% of the image height.
line3 = A(:,75); % extracts a vertical line from column 75 of matrix A, which represents a vertical line at 75% of the image width. The colon means all rows from that column.

% Count the number of changes in pixel value
count1 = nnz(diff(line1)); % counts the number of nonzero elements in the difference between adjacent elements of line1 using the nnz and diff functions. This gives the number of changes in pixel value along line1.
count2 = nnz(diff(line2)); % counts the number of changes in pixel value along line2 using the same logic as count1.
count3 = nnz(diff(line3)); % counts the number of changes in pixel value along line3 using the same logic as count1.

% Create a feature vector for the image
feature_vector = [count1 count2 count3];

% Compare the feature vector with predefined feature vectors for each character
if isequal(feature_vector, feature_vector_two)
    disp('Number two detected');
elseif isequal(feature_vector, feature_vector_four)
    disp('Number four detected');
elseif isequal(feature_vector, feature_vector_kaf)
    disp('Character kaf detected');
elseif isequal(feature_vector, feature_vector_sin)
    disp('Character sin detected');
elseif isequal(feature_vector, feature_vector_mim)
    disp('Character mim detected');
elseif isequal(feature_vector, feature_vector_sad)
    disp('Character sad detected');
elseif isequal(feature_vector, feature_vector_ta)
    disp('Character ta detected');
else
    disp('No match found');
end
