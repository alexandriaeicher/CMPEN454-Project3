%function grayscaleImage = proj3main(dirstring) 

%, maxframenum, abs_diff_threshold, alpha_parameter, gamma_parameter)
% dirstring = directory where numbered input image files are read from. You 
% can assume the filename format of the images is f0001.jpg , f0002.jpg, 
% f0003.jpg, … and so on.
%function grayscaleImage = proj3main(dirstring, maxframenum, abs_diff_threshold, alpha_parameter, gamma_parameter)
function grayscaleImage = proj3main(dirstring, maxframenum, abs_diff_threshold, alpha_parameter)

files = dir(fullfile(dirstring, '*.jpg'));   
%fileCount = length(files);% Number of files found

%disp(fileCount)

for i=1:maxframenum
   % 1. read in each image in a loop and convert it to grayscale
   filename = files(i).name;
   adaptfile = files(i+1).name;
   rgbImage = imread(fullfile(dirstring,filename));
   adaptrgbImage = imread(fullfile(dirstring,adaptfile));
   grayscaleImage = rgb2gray(rgbImage);
   adaptgrayscaleImage = rgb2gray(adaptrgbImage);
   B = rgb2gray(imread(fullfile(dirstring,files(1).name)));
   adaptB = rgb2gray((grayscaleImage*(1-alpha_parameter)) + (imread(fullfile(dirstring,adaptfile))*alpha_parameter));
   sbs = performSimpleBackgroupSubtraction(B, grayscaleImage, abs_diff_threshold);
   abs = performAdaptiveBackgroundSubtraction(adaptB, abs_diff_threshold, adaptgrayscaleImage);
   %imshow(sbs)
   imshow(abs)
   %imshow(grayscaleImage(1))
 %  imshow(grayscaleImage);
end
%imshow(grayscaleImage);
%imshow(B);

% maxframenum = integer which is the frame number of the last image file in 
% the sequence (the frame number of the first image file will always be 1). 
% For example, if maxframenum is 123, then you will be reading a sequence 
% of files f0001.jpg to f0123.jpg

% abs_diff_threshold = number between 0 and 255. It is the threshold called 
% “lambda” in the lecture slide pseudocode, responsible for converting 
% absolute intensity difference values into binary values 0 and 1.

% alpha_parameter = floating point number between 0 and 1. It is the alpha 
% “blending” parameter used in adaptive background subtraction algorithm.

% gamma_parameter = number between 0 and 255. It is the gamma “decay” 
% parameter used in the pseudocode for persistent frame differencing.
end
