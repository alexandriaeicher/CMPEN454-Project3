function grayscaleImage = proj3main(dirstring, maxframenum, abs_diff_threshold, alpha_parameter, gamma_parameter)

    files = dir(fullfile(dirstring, '*.jpg'));   
    H_pfd = 0;
    B_abs = rgb2gray(imread(fullfile(dirstring,files(1).name)));
    for i=2:maxframenum
       % 1. read in each image in a loop and convert it to grayscale
       filename = files(i).name;
       rgbImage = imread(fullfile(dirstring,filename));
       grayscaleImage = rgb2gray(rgbImage);

       B_sbs = rgb2gray(imread(fullfile(dirstring,files(1).name)));
       sbsImage = performSimpleBackgroupSubtraction(B_sbs, grayscaleImage, abs_diff_threshold);

       B_sfd = rgb2gray(imread(fullfile(dirstring,files(i-1).name)));
       sfdImage = performSimpleFrameDifferenceing(B_sfd, grayscaleImage, abs_diff_threshold);
        
       [absImage, B_abs] = performAdaptiveBackgroundSubtraction(B_abs, grayscaleImage, alpha_parameter, abs_diff_threshold);
       
       B_pfd = rgb2gray(imread(fullfile(dirstring,files(i-1).name)));
       [pfdImage, H_pfd] = performPersistentFrameDifferencing(B_pfd, H_pfd, grayscaleImage, abs_diff_threshold, gamma_parameter);
       
       spacer1 = ones(243, 2);
       spacer2 = ones(2, 320);
       spacer3 = ones(2,2);
       outImage = [sbsImage spacer1 sfdImage; spacer2 spacer3 spacer2; absImage spacer1 pfdImage];
       imshow(outImage);
    end
end
