function sbsImage = performSimpleBackgroupSubtraction(B, grayscaleImage, abs_diff_threshold)

 diff = abs(B - grayscaleImage);
% sbsImage = im2bw(diff, abs_diff_threshold);
sbsImage = diff > abs_diff_threshold;
 

end
