% MATLAB ASSIGNMENT Extra Credit #4
% Anthony Perea
% 02/06/21 Version #1.0
I = imread('mines.jpg');
I = rgb2gray(I);
I = 2 * I; % I used multiplication to brighten the image
imshow(I);